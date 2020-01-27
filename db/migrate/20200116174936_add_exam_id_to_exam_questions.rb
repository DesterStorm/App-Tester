class AddExamIdToExamQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :exam_questions, :exam_id, :integer
  end
end
