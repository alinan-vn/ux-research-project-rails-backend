class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|

      t.timestamps
    end
  end
end
