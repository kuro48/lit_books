class CreateCourses < ActiveRecord::Migration[8.0]
  def change
    create_table :courses, primary_key: "id" do |t|
      t.uuid :uid, null: false
      t.string :name, null: false
      t.string :icon_image_url
      t.timestamps
    end
  end
end
