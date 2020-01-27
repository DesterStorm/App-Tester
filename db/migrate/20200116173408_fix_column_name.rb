class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :exams, :answer, :exam_answer
    rename_column :exams, :option, :exam_option
    rename_column :exams, :question, :exam_question
  end
end
