class FixRemarksTable < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :remarks, :teachers
    rename_column :remarks, :teacher_id, :class_assignment_id
    add_foreign_key :remarks, :class_assignments
  end
end
