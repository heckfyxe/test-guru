class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :nullify

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  validates :first_name, presence: true
  validates :last_name, presence: true

  def tests_by_level(level)
    tests.where(level: level)
  end
end
