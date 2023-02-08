require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it "requires a first_name" do
      user = User.new(first_name: nil)
      expect(user).to_not be_valid
    end

    it "requires a last_name" do
      user = User.new(last_name: nil)
      expect(user).to_not be_valid
    end

    it "requires a gender" do
      user = User.new(gender: nil)
      expect(user).to_not be_valid
    end

    it "requires a mobile" do
      user = User.new(mobile: nil)
      expect(user).to_not be_valid
    end

    it "requires a email" do
      user = User.new(email: nil)
      expect(user).to_not be_valid
    end
 
    it "requires a password" do
      user = User.new(password: nil)
      expect(user).to_not be_valid
    end
  end

end
