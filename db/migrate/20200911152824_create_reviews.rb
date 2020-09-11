class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :buyer_id
      t.integer :product_id
      t.integer :rating_id
      t.string :description
    end
  end
end
