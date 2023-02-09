require 'rails_helper'

RSpec.describe User, type: :model do
    # user = FactoryBot.create(:user)  
    let(:cart) { Cart.find_by( user_id: user.id) }

  describe "validations" do
    it "requires a first_name" do
      user = FactoryBot.create(:user)
      user.first_name = nil
      result = user.valid?
      expect(user.errors.full_messages).eql?(["First name can't be blank"])
    end
  
    it "requires a last_name" do
      user = FactoryBot.create(:user)
      user.last_name = nil
      result = user.valid?
      expect(user.errors.messages).eql?(["Last name can't be blank"])
    end

    it "requires a gender" do
      user = FactoryBot.create(:user)
      user.gender = nil
      result = user.valid?
      expect(user.errors.full_messages).eql?(["Gender can't be blank"])
    end

    it "requires a mobile" do
      user = FactoryBot.create(:user)
      user.mobile = nil
      result = user.valid?
      expect(user.errors.full_messages).eql?(["Mobile can't be blank"])
    end

    it "requires a email" do
      user = FactoryBot.create(:user)
      user.email = nil
      result = user.valid?
      expect(user.errors.full_messages).eql?(["Email can't be blank"])
    end
 
    it "requires a password" do
      user = FactoryBot.create(:user)
      user.password = nil
      result = user.valid?
      expect(user.errors.full_messages).eql?(["Password can't be blank"])
    end
  end

  describe "associations" do
    it "has one cart" do
      user = FactoryBot.create(:user)
      cart = Cart.find_by(user_id:user.id)
      expect(user.cart).to eq(cart)
    end

    it "destroys the associated cart when destroyed" do
      user = FactoryBot.create(:user)
      expect { user.destroy }.to change { Cart.count }.by(-1)
    end
  end

end
