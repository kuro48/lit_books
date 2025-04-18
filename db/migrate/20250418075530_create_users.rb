class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users, primary_key: "id"  do |t|
      t.string :name, null: false
      t.string :user_name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :role, default: "member"
      t.string :course, null: false
      t.timestamps
    end
    add_index :users, :user_name, unique: true
    add_index :users, :email, unique: true
  end
end
