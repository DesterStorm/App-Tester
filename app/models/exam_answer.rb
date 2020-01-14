class ExamAnswer < ApplicationRecord
  belongs_to :exam, :inverse_of => :exam_answers
  accepts_nested_attributes_for :exam

  belongs_to :exam_question, :inverse_of => :exam_answers
  accepts_nested_attributes_for :exam_question
end
