# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_04_22_083504) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "books", force: :cascade do |t|
    t.uuid "uid", null: false
    t.string "title", null: false
    t.string "author"
    t.string "publisher"
    t.string "cover_image_url"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uid"], name: "index_books_on_uid", unique: true
  end

  create_table "courses", force: :cascade do |t|
    t.uuid "uid", null: false
    t.string "name", null: false
    t.string "icon_image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses_books", id: false, force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "book_id", null: false
    t.index ["book_id"], name: "index_courses_books_on_book_id"
    t.index ["course_id", "book_id"], name: "index_courses_books_on_course_id_and_book_id", unique: true
    t.index ["course_id"], name: "index_courses_books_on_course_id"
  end

  create_table "courses_users", id: false, force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "user_id", null: false
    t.index ["course_id", "user_id"], name: "index_courses_users_on_course_id_and_user_id", unique: true
    t.index ["course_id"], name: "index_courses_users_on_course_id"
    t.index ["user_id"], name: "index_courses_users_on_user_id"
  end

  create_table "lendings", force: :cascade do |t|
    t.uuid "uid", null: false
    t.bigint "user_id", null: false
    t.bigint "book_id", null: false
    t.datetime "lent_at", null: false
    t.datetime "due_at", null: false
    t.datetime "returned_at"
    t.index ["book_id"], name: "index_lendings_on_book_id"
    t.index ["uid"], name: "index_lendings_on_uid", unique: true
    t.index ["user_id"], name: "index_lendings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.uuid "uid", null: false
    t.string "name", null: false
    t.string "user_name", null: false
    t.string "email"
    t.string "password_digest", null: false
    t.string "profile_image_url"
    t.string "role", default: "member"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["uid"], name: "index_users_on_uid", unique: true
    t.index ["user_name"], name: "index_users_on_user_name", unique: true
  end

  add_foreign_key "courses_books", "books"
  add_foreign_key "courses_books", "courses"
  add_foreign_key "courses_users", "courses"
  add_foreign_key "courses_users", "users"
  add_foreign_key "lendings", "books"
  add_foreign_key "lendings", "users"
end
