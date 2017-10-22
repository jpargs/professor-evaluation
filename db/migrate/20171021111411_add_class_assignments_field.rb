class AddClassAssignmentsField < ActiveRecord::Migration[5.1]
  def change
    add_column :class_assignments, :slug, :string
  end
end
