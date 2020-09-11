class AddDetailsToSellers < ActiveRecord::Migration[6.0]
  def change
    add_column :sellers, :company, :string
    add_column :sellers, :title, :string
  end
end
