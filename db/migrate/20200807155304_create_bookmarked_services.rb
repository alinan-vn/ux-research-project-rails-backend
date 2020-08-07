class CreateBookmarkedServices < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarked_services do |t|
      t.integer :buyer_id
      t.integer :service_id

      t.timestamps
    end
  end
end
