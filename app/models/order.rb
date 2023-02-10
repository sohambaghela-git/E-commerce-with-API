class Order < ApplicationRecord
  belongs_to :user
  belongs_to :cart
  belongs_to :address

  validates :transaction_id, uniqueness: true
end
