class Exam < ApplicationRecord
  belongs_to :job_post, optional: true
  has_many   :exam_questions
  has_many   :exam_answers, through: :exam_questions
  accepts_nested_attributes_for :exam_questions, allow_destroy: true
  accepts_nested_attributes_for :exam_answers, allow_destroy: true
  #has_many   :exam_answers, dependent: :destroy, :inverse_of => :exam

  has_many :tests
  has_many :users, through: :tests
end
