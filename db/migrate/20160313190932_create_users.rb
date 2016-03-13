class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.integer :student_id
      t.string :class_name
      t.string :institue_name

      t.timestamps null: false
    end
  end
end
