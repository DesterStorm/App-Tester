class ExamQuestion < ApplicationRecord
  belongs_to :exam

  has_many :exam_options, dependent: :destroy, :inverse_of => :exam_question
  accepts_nested_attributes_for :exam_options

  has_many :exam_answers, dependent: :destroy, :inverse_of => :exam_question
  accepts_nested_attributes_for :exam_answers

  has_one  :correct_answer, -> { exam_options.where(correct:true) }
end
