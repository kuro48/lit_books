class CreateBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :books, primary_key: "id" do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.string :cover_image_url
      t.text :description
      t.string :course
      t.timestamps
    end
  end
end
