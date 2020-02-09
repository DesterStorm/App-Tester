class TestAnswer < ApplicationRecord
  belongs_to :test
  belongs_to :exam_question
  belongs_to :exam_answer

  def test_answer_params
    params.require(:test_answer).permit(:exam_answer_id, :test_id)
  end
end
