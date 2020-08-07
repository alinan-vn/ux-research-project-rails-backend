class CreateBookmarkedServices < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarked_services do |t|

      t.timestamps
    end
  end
end
