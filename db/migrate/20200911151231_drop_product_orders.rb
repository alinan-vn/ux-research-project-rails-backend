class DropProductOrders < ActiveRecord::Migration[6.0]
  def change
    drop_table :product_orders
  end
end
