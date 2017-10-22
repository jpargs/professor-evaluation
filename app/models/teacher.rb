class Teacher < ApplicationRecord
  has_many :remarks
  has_many :class_assignments
  has_many :students, through: :remarks
  has_many :subjects, through: :class_assignments
  after_save :generate_slug
  accepts_nested_attributes_for :class_assignments, allow_destroy: true
  accepts_nested_attributes_for :remarks, allow_destroy: true
  def name
    first_name.to_s + " " + last_name.to_s
  end
  
  def generate_slug
    if self.slug.blank? && self.first_name.present? && self.last_name.present?
      self.slug = self.id.to_s+"-"+self.first_name.parameterize+"-"+ self.last_name.parameterize
      self.save
    end
  end
end
