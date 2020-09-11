class CreateCartSelections < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_selections do |t|
      t.integer :cart_id
      t.integer :product_id
    end
  end
end
