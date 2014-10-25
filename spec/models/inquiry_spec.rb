require 'rails_helper'

RSpec.describe Inquiry do
  it { should belong_to(:user) }
  it { should respond_to :reason }
end
