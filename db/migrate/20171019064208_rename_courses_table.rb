class RenameCoursesTable < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :class_assignments, :courses
    rename_table :courses, :subjects
    rename_column :class_assignments, :course_id, :subject_id
    rename_column :subjects, :course_code, :subject_code
    rename_column :subjects, :course_name, :subject_name
    add_foreign_key :class_assignments, :subjects
    
  end
end
