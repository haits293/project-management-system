class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.text :bio
      t.string :website
      t.string :address
      t.datetime :birthday
      t.string :first_name
      t.string :last_name

      t.timestamps null: false
    end
  end
end
