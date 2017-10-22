class ChangeToForeignKeys < ActiveRecord::Migration[5.1]
  def change
    add_column :class_assignments, :course_id, :integer
    add_foreign_key :remarks, :students
    add_foreign_key :remarks, :teachers
    add_foreign_key :class_assignments, :teachers
    add_foreign_key :class_assignments, :courses
  end
end
