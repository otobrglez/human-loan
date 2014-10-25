require 'rails_helper'

RSpec.describe Inquiry do
  it { should belong_to(:user) }

  it "should do calculations" do
    puts Inquiry.new(score: 2, amount_cents: 10000, amount_currency: "USD").rates.inspect
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


100$
After repaying
=> (AMOUNT * interest rate * Duration) + amount[final]


1)
If you invest in oto, in 1 month you will get (100 * SCORE * 1/12) + 100,
if he pays in 6 mounths you'll get  (100 * SCORE * 1/2)+100 and if he pays after 12 months its
  (...)



Half a year with highest interest rate: (100 * 9,7% * 0,5) + 100 = 104,85
Full year cheapest middle interest rate = 1000 * 7,7% * 1 + 1000 = 1077


=end
