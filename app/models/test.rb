class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :testing_histories
  has_many :users, through: :testing_histories

  def self.test_titles_by_category_title(title)
    Category.find_by(title: title).tests.order(title: :asc).collect(&:title)
  end
end
