class DropBookmarkedServices < ActiveRecord::Migration[6.0]
  def change
    drop_table :bookmarked_services
  end
end
