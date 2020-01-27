class AddColumnsToExamAnswers < ActiveRecord::Migration[6.0]
  def change
    add_column :exam_answers, :letter, :string
    add_column :exam_answers, :answer, :string
    remove_column :exam_answers, :exam_answer, :boolean
  end
end
