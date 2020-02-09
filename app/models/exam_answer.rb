class ExamAnswer < ApplicationRecord
  # belongs_to :exam, optional: true #:inverse_of => :exam_answers
  belongs_to :exam_question
  has_many :test_answers
  accepts_nested_attributes_for :test_answers

  def correct
    self.correct = true
  end

  def exam_answer_params
    params.require(:exam_answer).permit(:exam_question_id, :exam_id, :letter, :correct, :answer)
  end
end
