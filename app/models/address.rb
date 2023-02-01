class Address < ApplicationRecord
  belongs_to :user
  has_many :
  validates :colony, :pincode, :state, :city, presence: true
end
