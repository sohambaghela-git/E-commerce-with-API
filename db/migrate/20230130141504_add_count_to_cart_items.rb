class AddCountToCartItems < ActiveRecord::Migration[7.0]
  def change
    add_column :cart_items, :count, :integer
  end
end
