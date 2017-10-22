class AverageCache < ActiveRecord::Base
  belongs_to :rater, :class_name => "student"
  belongs_to :rateable, :polymorphic => true
end
