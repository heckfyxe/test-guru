class AddTimerForTests < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :duration_in_minutes, :integer, null: true, default: nil
    add_column :test_passages, :end_at, :datetime, null: true, default: nil
  end
end
