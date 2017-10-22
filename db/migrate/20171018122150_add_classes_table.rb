class AddClassesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :classes, force: true do |t|
      t.string   :class_code, null: false
      t.string   :class_name, null: false
      t.integer  :status
      t.datetime :created_at
      t.datetime :updated_at
    end
    add_index :classes, :class_code, unique: true
  end
end
