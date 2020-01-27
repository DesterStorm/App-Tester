class Test < ApplicationRecord
  belongs_to :user
  belongs_to :exam
  has_many :exam_answers
  #delegate :exam_questions
  accepts_nested_attributes_for :exam_answers
end
