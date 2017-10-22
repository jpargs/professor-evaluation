class ClassAssignment < ApplicationRecord
  belongs_to :subject
  belongs_to :teacher
  has_many :student_enlistments
  has_many :remarks
  has_many :students, through: :student_enlistments
  accepts_nested_attributes_for :remarks, allow_destroy: true
  after_save :generate_slug
  
  def generate_slug
    if self.slug.blank? && self.teacher_id.present? && self.subject_id.present?
      teacher_name = Teacher.find(self.teacher_id).name
      subject_name = Subject.find(self.subject_id).full_subject_name
      self.slug = self.id.to_s+"-"+teacher_name.parameterize+"-"+ subject_name.parameterize
      self.save
    end
  end
  
  scope :find_slug,->(subject_id, teacher_id) {
    select("subject_id, teacher_id, slug")
      .from("class_assignments")
      .where("subject_id = ? AND teacher_id = ?",subject_id,teacher_id)
  }

end
