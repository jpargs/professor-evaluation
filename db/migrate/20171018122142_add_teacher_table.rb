class AddTeacherTable < ActiveRecord::Migration[5.1]
  def change
    create_table :teachers, force: true do |t|
      t.string   :first_name, null: false
      t.string   :last_name, null: false
      t.integer  :status
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
