class ChangeExamOptionsToApplicantAnswer < ActiveRecord::Migration[6.0]
  def change
    drop_table :exam_options
  end
end
