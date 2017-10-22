class Remark < ApplicationRecord
  ratyrate_rateable "rating"
  belongs_to :student
  belongs_to :class_assignment
  
  scope :check_for_current_student_rating, ->(student_id, class_assignment_id) {
    select("*")
      .from("remarks")
      .where("student_id = ? AND class_assignment_id = ?",student_id,class_assignment_id)
  } 
  
  scope :get_overall_average, ->(teacher_id) {
    select("t.id as teacher_id, r.rating")
      .from("remarks r join class_assignments ca on r.class_assignment_id = ca.id join teachers t on ca.teacher_id = t.id")
      .where("t.id = ?",teacher_id)
  } 
end
