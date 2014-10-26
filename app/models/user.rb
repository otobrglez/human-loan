class User < ActiveRecord::Base
  include Clearance::User
  has_many :inquiries

  has_many :given_loans, foreign_key: 'giver_id', class_name: 'Loan'
  has_many :taken_loans, foreign_key: 'taker_id', class_name: 'Loan'

  def public_name
    if first_name.present?
      return first_name
    else
      email[0, email.index('@')+2]+".."
    end
  end

  def gravatar
    hash = Digest::MD5.hexdigest(self.email)
    "http://www.gravatar.com/avatar/#{hash}"
  end
end
