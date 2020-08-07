class CreatePurchaseOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_orders do |t|
      t.integer :buyer_id
      t.integer :product_id

      t.timestamps
    end
  end
end
