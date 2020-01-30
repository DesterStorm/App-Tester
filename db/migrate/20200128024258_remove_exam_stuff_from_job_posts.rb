class RemoveExamStuffFromJobPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :exams, :exam_question, :string
    remove_column :exams, :exam_answer, :string
    remove_column :exams, :exam_option, :string
  end
end
