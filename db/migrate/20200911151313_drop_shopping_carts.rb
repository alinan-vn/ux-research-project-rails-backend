class DropShoppingCarts < ActiveRecord::Migration[6.0]
  def change
    drop_table :shopping_carts
  end
end
