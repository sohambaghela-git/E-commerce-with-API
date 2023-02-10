class Address < ApplicationRecord
  belongs_to :user
  has_many :orders
  
  validates :colony, :pincode, :state, :city, presence: true
  validates :pincode, numericality: { only_integer: true }

end
