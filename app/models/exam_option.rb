class ExamOption < ApplicationRecord
  belongs_to :exam_question, :inverse_of => :exam_options
  accepts_nested_attributes_for :exam_question
end
