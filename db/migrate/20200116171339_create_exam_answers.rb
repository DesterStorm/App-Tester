class CreateExamAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :exam_answers do |t|
      t.boolean :exam_answer
      t.belongs_to :exam_question, index: true
      t.belongs_to :exam, index: true

      t.timestamps
    end
  end
end
