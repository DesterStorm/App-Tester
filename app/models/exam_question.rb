class ExamQuestion < ApplicationRecord
  validates :exam, :presence => true
  belongs_to :exam

  has_many :exam_answers, dependent: :destroy, :inverse_of => :exam_question
  accepts_nested_attributes_for :exam_answers

  scope :correct_answer, -> { ExamAnswer.where(correct: true) }
end
