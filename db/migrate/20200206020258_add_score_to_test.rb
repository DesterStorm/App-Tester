class AddScoreToTest < ActiveRecord::Migration[6.0]
  def change
    add_column :test, :score, :integer
  end
end
