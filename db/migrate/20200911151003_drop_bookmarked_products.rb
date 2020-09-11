class DropBookmarkedProducts < ActiveRecord::Migration[6.0]
  def change
    drop_table :bookmarked_products
  end
end
