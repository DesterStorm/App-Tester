class ChangeColumnTypeAnswerInOptions < ActiveRecord::Migration[6.0]
  def change
    change_column :exam_options, :answer, :boolean
  end
end
