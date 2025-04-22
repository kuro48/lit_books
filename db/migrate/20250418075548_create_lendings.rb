class CreateLendings < ActiveRecord::Migration[8.0]
  def change
    create_table :lendings, primary_key: "id" do |t|
      t.uuid :uid, null: false
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.datetime :lent_at, null: false
      t.datetime :due_at, null: false
      t.datetime :returned_at
    end
    add_index :lendings, :uid, unique: true
  end
end
