class CreateSellers < ActiveRecord::Migration[6.0]
  def change
    create_table :sellers do |t|
      t.string :first_name
      t.string :last_name
      t.string :password_digest
      t.string :email

      t.timestamps
    end
  end
end
