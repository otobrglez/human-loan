class Inquiry < ActiveRecord::Base
  has_many :loans
  belongs_to :user
  validates :reason, presence: true, length: 20..200

  monetize :amount_cents
  paginates_per 20

  scope :active, -> {
    joins(:user).order(score: :desc, created_at: :desc, expires_at: :asc)
  }

  # def amount
  #   cents = read_attribute(:amount) || 0
  #   currency = read_attribute(:currency_as_string) || Money.default_currency
  #   Money.new(cents, currency)
  # end

  # def amount=(value)
  #   cash = Money.from_string(value)
  #   write_attribute(:amount, cash.cents)
  # end

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

  def rates_insured
    @rates_insured ||= rates_cp(AVIVA_RATE)
  end

  def loan_given?
    ! loans.empty?
  end

  BASIC_RATE = 0.052
  AVIVA_RATE = -0.005
  def rates_cp(rate=BASIC_RATE)
    numbers = (0..9).to_a
    numbers.map! { |n| rate + n*0.005 }

    durations = {
      m_1:  1.to_f/12.to_f,
      m_6:  1.to_f/2.to_f,
      m_12: 1.to_f
    }

    {
      m_1:  Money.new( (amount_cents* numbers[score]* durations[:m_1])+amount_cents, self.amount_currency),
      m_6:  Money.new( (amount_cents* numbers[score]* durations[:m_6])+amount_cents, self.amount_currency),
      m_12: Money.new( (amount_cents* numbers[score]* durations[:m_12])+amount_cents, self.amount_currency)
    }
  end
end
