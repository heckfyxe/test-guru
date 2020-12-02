class CreateTestingHistory < ActiveRecord::Migration[6.0]
  def change
    create_table :testing_histories do |t|
      t.references :user, foreign_key: true
      t.references :test, foreign_key: true
      t.boolean :completed, default: false
    end
  end
end
