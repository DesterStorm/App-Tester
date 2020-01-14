class CreateExamOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :exam_options do |t|
      t.string   :letter
      t.string   :answer
      t.integer  :exam_question_id

      t.timestamps
    end
    add_index :exam_options, :exam_question_id
  end
end
