class Inquiry < ActiveRecord::Base
  BASIC_RATE = 5.2

  belongs_to :user
  validates :reason, presence: true, length: 20..200

  monetize :amount_cents
  paginates_per 7

  scope :active, -> {
    joins(:user).order(created_at: :desc, expires_at: :asc)
  }

  def format_price
    amount.format
  end

  before_validation :generate_score

  def generate_score
    self.score = rand(10)
  end

  def rates
    @rates ||= rates_cp
  end

  def rates_cp
    rates_out=[]
    scores = (0..9).to_a
    scores.each do |i|
      a = (scores.size-i-1)
      rates_out[i]= BASIC_RATE + (a.to_i*0.5)
    end
    ###

    factors={
      m_1: 1.to_f/12.to_f,
      m_6: 1.to_f/2.to_f,
      y_1: 1.to_f/1.to_f
    }

    {
      m_1: ((amount_cents.to_f * rates_out[score] * factors[:m_1]) + amount_cents.to_f),
      m_6: ((amount_cents.to_f * rates_out[score] * factors[:m_6]) + amount_cents.to_f),
      y_1: ((amount_cents.to_f * rates_out[score] * factors[:y_1]) + amount_cents.to_f)
    }
  end
end
