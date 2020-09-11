class CreateWishlists < ActiveRecord::Migration[6.0]
  def change
    create_table :wishlists do |t|
      t.integer :buyer_id
      t.integer :product_id
    end
  end
end
