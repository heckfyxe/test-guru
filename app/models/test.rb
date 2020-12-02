class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :testing_histories
  has_many :users, through: :testing_histories
  belongs_to :author, class_name: 'User'

  def self.test_titles_by_category_title(title)
    Test.joins('JOIN categories ON tests.category_id = categories.id')
        .where('categories.title': title)
        .order(title: :asc)
        .pluck(:title)
  end
end
