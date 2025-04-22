class CreateCoursesUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :courses_users, id: false do |t|
      t.references :course, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
    end
    add_index :courses_users, [:course_id, :user_id], unique: true
  end
end
