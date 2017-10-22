module ApplicationHelper
  def title(page_title)
    content_for :title, "Professor Evaluation - " + page_title.to_s
  end
  def get_slug(subject_id, teacher_id)
    ca = ClassAssignment.find_slug(subject_id, teacher_id)
    ca.first.slug if ca.first.present?
  end
  
  def student_has_rated(student_id, class_assignment_id)
    remark = Remark.check_for_current_student_rating(student_id, class_assignment_id)
    true if remark.present?
  end
  
  def get_average_for_class_assignment(class_assignment_id)
    ave_rating = Remark.where("class_assignment_id = ?", class_assignment_id).average('rating').to_i
    
  end
  
  def get_overall_average(teacher_id)
    overall = Remark.get_overall_average(teacher_id).average('r.rating').to_i
  end
end
