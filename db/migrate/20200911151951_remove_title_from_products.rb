class RemoveTitleFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :title, :string
  end
end
