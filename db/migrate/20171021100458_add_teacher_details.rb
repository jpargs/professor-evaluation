class AddTeacherDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :teachers, :slug, :string
    add_column :teachers, :short_description, :text
  end
end
