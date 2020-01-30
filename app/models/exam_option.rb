class ExamOption < ApplicationRecord
  belongs_to :exam_question, :inverse_of => :exam_options


  #has_one :exam_answer
end
