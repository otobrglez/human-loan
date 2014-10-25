require 'rails_helper'

RSpec.describe User do
  it { should have_many(:inquiries) }
  it { should respond_to :first_name, :last_name }
  context "name" do
    it { expect(User.new(email: "otobrglez@gmail.com").public_name).to eq 'otobrglez@g..' }
    it { expect(User.new(email: "otobrglez@gmail.com", first_name: "Oto").public_name).to eq 'Oto' }
  end
end
