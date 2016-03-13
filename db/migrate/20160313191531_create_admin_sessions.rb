class CreateAdminSessions < ActiveRecord::Migration
  def change
    create_table :admin_sessions do |t|
      t.integer :admin_id
      t.string :token_key
      t.string :status

      t.timestamps null: false
    end
  end
end
