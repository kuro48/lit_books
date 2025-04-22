class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users, primary_key: "id"  do |t|
      t.uuid :uid, null: false
      t.string :name, null: false
      t.string :user_name, null: false
      t.string :email
      t.string :password_digest, null: false
      t.string :profile_image_url
      t.string :role, default: "member"
      t.timestamps
    end
    add_index :users, :uid, unique: true
    add_index :users, :user_name, unique: true
    add_index :users, :email, unique: true
  end
end
