class DropTestingHistory < ActiveRecord::Migration[6.0]
  def up
    drop_table :testing_histories, if_exists: true
  end

  def down
    create_table :testing_histories do |t|
      t.references :user, foreign_key: true
      t.references :test, foreign_key: true
      t.boolean :completed, default: false
    end
  end
end
