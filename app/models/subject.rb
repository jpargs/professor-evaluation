class Subject < ApplicationRecord
  has_many :class_assignments, dependent: :nullify
  has_many :teachers, through: :class_assignments
  after_save :generate_slug
  accepts_nested_attributes_for :class_assignments, allow_destroy: true
  
  def full_subject_name
    "#{subject_code.to_s} - #{subject_name.to_s}"
  end
  def generate_slug
    if self.slug.blank? && self.subject_name.present?
      self.slug = self.id.to_s+"-"+self.subject_code.parameterize+"-"+ self.subject_name.parameterize
      self.save
    end
  end
  #params.require(:course).permit(:course_code, :course_name, :status, :created_at, :updated_at)
end
