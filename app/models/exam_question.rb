class ExamQuestion < ApplicationRecord
  has_many :exam_options, dependent: :destroy, :inverse_of => :exam_question
  accepts_nested_attributes_for :exam_options

  has_many :exam_answers, dependent: :destroy, :inverse_of => :exam_question
  accepts_nested_attributes_for :exam_answers
end
