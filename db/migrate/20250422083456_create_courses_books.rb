class CreateCoursesBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :courses_books, id: false do |t|
      t.references :course, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
    end
    add_index :courses_books, [:course_id, :book_id], unique: true
  end
end
