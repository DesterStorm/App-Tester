class TestAnswer < ApplicationRecord
  belongs_to :test
  belongs_to :exam_question
  belongs_to :exam_answer

end
