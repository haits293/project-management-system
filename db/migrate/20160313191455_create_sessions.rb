class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.integer :user_id
      t.string :token_key
      t.string :status

      t.timestamps null: false
    end
  end
end
