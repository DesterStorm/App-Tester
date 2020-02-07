class Exam < ApplicationRecord
  validates :job_post, presence: true
  belongs_to :job_post
  has_many   :exam_questions, dependent: :destroy, inverse_of: :exam
  has_many   :exam_answers, dependent: :destroy, through: :exam_questions
  accepts_nested_attributes_for :exam_questions, allow_destroy: true
  accepts_nested_attributes_for :exam_answers, allow_destroy: true
  #has_many   :exam_answers, dependent: :destroy, :inverse_of => :exam

  has_many :tests, dependent: :destroy, inverse_of: :exam
  accepts_nested_attributes_for :tests, allow_destroy: true
  has_many :users, through: :tests
end
