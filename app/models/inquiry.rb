class Inquiry < ActiveRecord::Base
  belongs_to :user
  validates :reason, presence: true, length: 20..200

  monetize :amount_cents
  paginates_per 5

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
end
