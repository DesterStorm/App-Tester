class Exam < ApplicationRecord
  belongs_to :job_post
  has_many   :exam_questions
  has_many   :exam_answers, dependent: :destroy, :inverse_of => :exam
  accepts_nested_attributes_for :exam_answers

  has_and_belongs_to_many :tests
  accepts_nested_attributes_for :tests
end
