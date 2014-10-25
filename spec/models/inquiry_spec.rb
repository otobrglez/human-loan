require 'rails_helper'

RSpec.describe Inquiry do
  it { should belong_to(:user) }

  it "should do calculations" do
    puts Inquiry.new(score: 9, amount_cents: 10000, amount_currency: "USD").rates.inspect
  end
end

=begin

9 -> 0 (best credit score => basic interest rate of 5,2%)
8 -> 1 (basic interest rate of 5,2% plus one time 0,5% = 5,7)
7 -> 2 (5,2% + 2*0,5 = 6,2%)
6 -> 3
5 -> 4
4 -> 5 (5,2% 5*0,5=7,7%)
3 -> 6
2 -> 7
1 -> 8
0 -> 9 (5,2 +9*0,5= 9,7%)

Duration
1 month => 1/12
6 months => 1/2
12 months => 1/1

=> (AMOUNT * interest rate * Duration) + amount

Half a year with highest interest rate: (100 * 9,7% * 0,5) + 100 = 104,85
Full year cheapest middle interest rate = 1000 * 7,7% * 1 + 1000 = 1077


=end
