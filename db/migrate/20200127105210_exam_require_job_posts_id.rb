class ExamRequireJobPostsId < ActiveRecord::Migration[6.0]
  def change
    change_column :exams, :job_post_id, :integer, null: false
  end
end
