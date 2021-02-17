class AddScoreToTestPassages < ActiveRecord::Migration[6.0]
  def change
    add_column :test_passages, :score, :integer
  end
end
