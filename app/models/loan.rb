class Loan < ActiveRecord::Base
  belongs_to :giver, foreign_key: 'giver_id', class_name: 'User'
  belongs_to :taker, foreign_key: 'taker_id', class_name: 'User'
  belongs_to :inquiry
end
