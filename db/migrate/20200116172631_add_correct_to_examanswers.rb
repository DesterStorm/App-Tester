class AddCorrectToExamanswers < ActiveRecord::Migration[6.0]
  def change
    add_column :exam_answers, :correct, :boolean
  end
end
