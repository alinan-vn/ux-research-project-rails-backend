class CreateShoppingCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_carts do |t|
      t.integer :buyer_id
      t.string :status
      t.string :products
      t.string :services
      t.float :value

      t.timestamps
    end
  end
end
