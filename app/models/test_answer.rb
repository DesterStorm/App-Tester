class TestAnswer < ApplicationRecord
  belongs_to :test
  belongs_to :exam_answer
  belongs_to :exam_question
end
