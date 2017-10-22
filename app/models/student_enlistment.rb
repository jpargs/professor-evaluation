class StudentEnlistment < ApplicationRecord
  belongs_to :student
  belongs_to :class_assignment
  has_many :remarks
end
