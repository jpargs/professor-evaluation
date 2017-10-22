class Student < ApplicationRecord
  ratyrate_rater
  has_many :remarks
  has_many :student_enlistments
  has_many :class_assignments, through: :student_enlistments
  has_many :teachers, through: :class_assignments
  accepts_nested_attributes_for :student_enlistments, allow_destroy: true
  accepts_nested_attributes_for :remarks, allow_destroy: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
 def name
   first_name.to_s + " " + last_name.to_s
 end
end
