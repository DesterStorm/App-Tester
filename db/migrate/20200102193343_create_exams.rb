class CreateExams < ActiveRecord::Migration[6.0]
  def change
    create_table :exams do |t|
      t.string    :name,       null: false, default: ""
      t.string    :question,   null: false, default: ""
      t.string    :option,     null: false, default: ""
      t.string    :answer,     null: false, default: ""
      t.integer   :job_post_id

      t.timestamps
    end

    add_index :exams, ["client_id"], name: "index_exams_on_client_id"
    add_index :exams, ["user_id"], name: "index_exams_on_user_id"

  end
end
