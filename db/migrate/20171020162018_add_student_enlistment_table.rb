class AddStudentEnlistmentTable < ActiveRecord::Migration[5.1]
  def change
    create_table :student_enlistments, force: true do |t|
      t.integer  :class_assignment_id, null: false
      t.integer  :student_id, null: false
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
