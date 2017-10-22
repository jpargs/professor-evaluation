class ChangeClassToCourse < ActiveRecord::Migration[5.1]
  def change
    drop_table :classes
    remove_column :class_assignments, :class_id, :integer
    create_table :courses, force: true do |t|
      t.string   :course_code, null: false
      t.string   :course_name, null: false
      t.integer  :status
      t.datetime :created_at
      t.datetime :updated_at
    end
    add_index :courses, :course_code, unique: true
  end
end
