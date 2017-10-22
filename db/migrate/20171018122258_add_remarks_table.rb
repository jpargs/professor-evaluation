class AddRemarksTable < ActiveRecord::Migration[5.1]
  def change
    create_table :remarks, force: true do |t|
      t.integer   :student_id, null: false
      t.integer   :teacher_id, null: false
      t.integer   :rating, null: false
      t.text      :remark, null: false
      t.integer   :status
      t.datetime  :created_at
      t.datetime  :updated_at
    end
  end
end
