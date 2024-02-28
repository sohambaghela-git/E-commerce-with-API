class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items
  has_many :orders

end
