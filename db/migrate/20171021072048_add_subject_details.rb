class AddSubjectDetails < ActiveRecord::Migration[5.1]
  def change
    remove_column :subjects, :status, :integer
    remove_column :class_assignments, :status, :integer
    remove_column :remarks, :status, :integer
    remove_column :teachers, :status, :integer
    add_column :subjects, :slug, :string
    add_column :subjects, :short_description, :text
  end
end
