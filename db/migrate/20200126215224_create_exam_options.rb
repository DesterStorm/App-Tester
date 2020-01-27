class CreateExamOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :exam_options do |t|
      t.string :letter
      t.string :answer
      t.integer :exam_question_id
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
    add_index :exam_options, :exam_question_id
  end
end
