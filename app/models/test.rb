class Test < ApplicationRecord
  def self.test_titles_by_category_title(title)
    Test.joins('JOIN categories ON tests.category_id = categories.id')
        .where('categories.title': title)
        .order(title: :asc)
        .pluck(:title)
  end
end
