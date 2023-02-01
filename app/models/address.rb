class Address < ApplicationRecord
  belongs_to :user
  validates :colony, :pincode, :state, :city, presence: true
end
