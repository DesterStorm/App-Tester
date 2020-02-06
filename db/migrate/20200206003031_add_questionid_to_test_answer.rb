class AddQuestionidToTestAnswer < ActiveRecord::Migration[6.0]
  def change
    add_column :test_answers, :exam_question_id, :integer
  end
end
