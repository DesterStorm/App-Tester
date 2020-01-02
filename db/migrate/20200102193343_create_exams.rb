class CreateExams < ActiveRecord::Migration[6.0]
  def change
    create_table :exams do |t|
      t.string    :name,       null: false, default: ""
      t.integer   :client_id,  null: false, default: ""
      t.integer   :user_id,    null: false, default: ""

      t.timestamps
    end

    add_index :exams, ["client_id"], name: "index_exams_on_client_id"
    add_index :exams, ["user_id"], name: "index_exams_on_user_id"

  end
end
