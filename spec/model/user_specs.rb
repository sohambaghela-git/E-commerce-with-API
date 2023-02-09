require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(first_name:"John", last_name:"baghela", gender:"male",password:"123456",email:"example@gmail.com",mobile:"08949", role:"buyer") }
  let(:cart) { Cart.create( user_id: user.id) }

  describe "validations" do
    it "requires a first_name" do
      user = User.new(first_name: nil, last_name:"baghela", gender:"male",password:"123456",email:"example@gmail.com",mobile:"08949" )
      result = user.valid?
      expect(user.errors.full_messages).eql?(["First name can't be blank"])
    end
    
    it "requires a last_name" do
      user = User.new(first_name: "soham", last_name:nil, gender:"male",password:"123456",email:"example@gmail.com",mobile:"08949")
      result = user.valid?
      expect(user.errors.messages).eql?(["Last name can't be blank"])
    end

    it "requires a gender" do
      user = User.new(first_name: "soham", last_name:"baghela", gender:nil,password:"123456",email:"example@gmail.com",mobile:"08949" )
      result = user.valid?
      expect(user.errors.full_messages).eql?(["Gender can't be blank"])
    end

    it "requires a mobile" do
      user = User.new(first_name: "soham", last_name:"baghela", gender:"male",password:"123456",email:"example@gmail.com",mobile:nil )
      result = user.valid?
      expect(user.errors.full_messages).eql?(["Mobile can't be blank"])
    end

    it "requires a email" do
      user = User.new(first_name: "soham", last_name:"baghela", gender:"male",password:"123456",email:nil,mobile:"08949" )
      result = user.valid?
      expect(user.errors.full_messages).eql?(["Email can't be blank"])
    end
 
    it "requires a password" do
      user = User.new(first_name: "soham", last_name:"baghela", gender:"male",password:nil,email:"example@gmail.com",mobile:"08949" )
      result = user.valid?
      expect(user.errors.full_messages).eql?(["Password can't be blank"])
    end
  end

  describe "associations" do
    it "has one cart" do
      expect(user.cart) == (cart)
    end

    it "destroys the associated cart when destroyed" do
      expect { user.destroy }.to change { Cart.count }.by(0)
    end
  end

end
