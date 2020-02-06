class RemoveSelectionColumnFromTestAnswers < ActiveRecord::Migration[6.0]
  def change
    remove_column :test_answers, :selection, :boolean
  end
end
