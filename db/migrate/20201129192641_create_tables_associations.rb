class CreateTablesAssociations < ActiveRecord::Migration[6.0]
  def change
    add_reference :tests, :category
    add_reference :questions, :test
    add_reference :answers, :question

    create_table :testing_histories do |t|
      t.references :user
      t.references :test
      t.boolean :completed, default: false
    end
  end
end
