class AddBooleanToTestAnswers < ActiveRecord::Migration[6.0]
  def change
    add_column :test_answers, :selection, :boolean
  end
end
