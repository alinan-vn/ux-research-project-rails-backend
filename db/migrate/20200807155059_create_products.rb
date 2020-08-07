class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.integer :seller_id
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
