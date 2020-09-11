class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :buyer_id
      t.integer :cart_id
    end
  end
end
