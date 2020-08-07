class CreateBookmarkedProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarked_products do |t|
      t.integer :buyer_id
      t.integer :product_id

      t.timestamps
    end
  end
end
