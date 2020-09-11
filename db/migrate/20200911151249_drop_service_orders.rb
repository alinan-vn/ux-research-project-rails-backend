class DropServiceOrders < ActiveRecord::Migration[6.0]
  def change
    drop_table :service_orders
  end
end
