class Product < ApplicationRecord
	belongs_to :user
	has_many :cart_items

  validates :name, :detail, :price, presence: true
  validates :price, numericality: { only_integer: true }

end
