class AddColumnsToExamQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :exam_questions, :active,   :boolean
    add_column :exam_questions, :order,    :integer
    add_column :exam_questions, :question, :string
    add_column :exam_questions, :letter,   :string
    add_column :exam_questions, :answer,   :string
  end
end
