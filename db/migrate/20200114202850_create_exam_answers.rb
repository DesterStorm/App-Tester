class CreateExamAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :exam_answers do |t|
      t.string   :letter
      t.string   :answer
      t.boolean  :correct
      t.integer  :exam_question_id
      t.integer  :exam_id

      t.timestamps
    end
    add_index :exam_answers, :exam_id
    add_index :exam_answers, :exam_question_id
  end
end
