class AddClassesTeachersMappingTable < ActiveRecord::Migration[5.1]
  def change
    create_table :class_assignments, force: true do |t|
      t.integer  :class_id, null: false
      t.integer  :teacher_id, null: false
      t.integer  :status
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
