class CreateBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :books, primary_key: "id" do |t|
      t.uuid :uid, null: false
      t.string :title, null: false
      t.string :author
      t.string :publisher
      t.string :cover_image_url
      t.text :description
      t.timestamps
    end
    add_index :books, :uid, unique: true
  end
end
