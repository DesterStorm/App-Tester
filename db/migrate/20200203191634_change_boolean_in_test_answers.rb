class ChangeBooleanInTestAnswers < ActiveRecord::Migration[6.0]
  def change
    change_column :test_answers, :selection, :boolean, null: false, default: :false
  end
end
