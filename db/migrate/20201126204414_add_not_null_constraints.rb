class AddNotNullConstraints < ActiveRecord::Migration[6.0]
  def up
    change_column_null :users, :first_name, false
    change_column_null :users, :last_name, false

    change_column_null :categories, :title, false

    change_column_null :tests, :title, false

    change_column_null :questions, :text, false

    change_column_null :answers, :text, false
  end

  def down
    change_column_null :users, :first_name, true
    change_column_null :users, :last_name, true

    change_column_null :categories, :title, true

    change_column_null :tests, :title, true

    change_column_null :questions, :text, true

    change_column_null :answers, :text, true
  end
end
