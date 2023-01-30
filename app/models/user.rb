class User < ApplicationRecord
  has_secure_password
  has_many :products
	has_one :cart
	has_many :cart_items

	# User Register Validation
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true, uniqueness: true
	validates :mobile, presence: true, numericality: true
	validates :gender, presence: true
	validates :password, presence: true
	
end
