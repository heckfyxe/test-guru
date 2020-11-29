class User < ApplicationRecord
  has_many :testing_histories
  has_many :tests, through: :testing_histories

  def tests_by_level(level)
    tests.where(level: level)
  end
end
