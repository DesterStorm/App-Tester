class AddScoreToTest < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :score, :integer
  end
end
