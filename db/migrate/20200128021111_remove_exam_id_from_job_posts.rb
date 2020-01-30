class RemoveExamIdFromJobPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :job_posts, :exam_id, :integer
  end
end
