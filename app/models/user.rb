class User < ApplicationRecord
  after_create :create_cart
  
  has_secure_password
  has_many :products
	has_one :cart, dependent: :destroy
	has_many :cart_items
	has_many :addresses
	has_many :orders

	# User Register Validation
	validates :first_name, :last_name, :gender,:password, presence: true
	validates :email, presence: true, uniqueness: true
	validates :mobile, presence: true, numericality: true
  validates :role, inclusion: { in: ['buyer', 'seller']}
  
	private
	def create_cart
    Cart.create(user_id: self.id)
  end

end
