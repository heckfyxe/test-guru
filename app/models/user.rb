class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'
  has_many :testing_histories
  has_many :tests, through: :testing_histories

  def tests_by_level(level)
    Test.joins('JOIN testing_histories ON tests.id = testing_histories.test_id').where('testing_histories.user_id': id, level: level)
  end
end
