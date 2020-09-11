class AddDetailsToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :name, :string
    add_column :products, :price, :string
    add_column :products, :hours, :integer
  end
end
