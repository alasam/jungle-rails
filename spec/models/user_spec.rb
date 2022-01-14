require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it "should save user if all fields filled in correctly" do
      user = User.new(
        first_name: "Test",
        last_name: "Name",
        email: "test@email.com",
        password: "qwerty",
        password_confirmation: "qwerty"
      )
      expect(user).to be_valid
    end

    it "should save user if first name and last name fields filled in correctly" do
      user = User.new(
        first_name: nil,
        last_name: nil,
        email: "test@email.com",
        password: "qwerty",
        password_confirmation: "qwerty"
      )
      expect(user).to_not be_valid
      print "------------ error ="
      print user.errors.full_messages
    end

    it "should save user if no existing email is already registered" do
      user1 = User.new(
        first_name: "Test",
        last_name: "Name",
        email: "test@email.com",
        password: "qwerty",
        password_confirmation: "qwerty"
      )
      user2 = User.new(
        first_name: "Test",
        last_name: "Name",
        email: "TEST@EMAIL.COM",
        password: "qwerty",
        password_confirmation: "qwerty"
      )
      expect(user2).to be_valid
      print "------------ error ="
      print user2.errors.full_messages
    end

    it "should save user if both password and password confirmation match" do
      user = User.new(
        first_name: nil,
        last_name: nil,
        email: "test@email.com",
        password: "qwerty",
        password_confirmation: "qwerty1"
      )
      expect(user).to_not be_valid
      print "------------ error ="
      print user.errors.full_messages
    end

    it "should save user if password is atleast 5 characters" do
      user = User.new(
        first_name: nil,
        last_name: nil,
        email: "test@email.com",
        password: "qwert",
        password_confirmation: "qwert"
      )
      expect(user).to_not be_valid
      print "------------ error ="
      print user.errors.full_messages
    end

  end
end
