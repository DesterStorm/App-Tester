class Exam < ApplicationRecord
  belongs_to :user
  belongs_to :client
  has_many   :exam_answers, dependent: :destroy, :inverse_of => :exam
  accepts_nested_attributes_for :exam_answers
end
