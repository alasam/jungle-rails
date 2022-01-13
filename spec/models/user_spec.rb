require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it "should save user if all fields filled in correctly" do
      user = user.new(
        first_name: "Test"
        last_name: "Name"
        password: "qwerty"
        password_confirmation: "qwerty"
      )
      expect(user).to be_valid
    end
end
