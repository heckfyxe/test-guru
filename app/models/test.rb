class Test < ApplicationRecord
  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy

  has_many :testing_histories, dependent: :destroy
  has_many :users, through: :testing_histories

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level }

  def self.test_titles_by_category_title(title)
    Category.find_by(title: title).tests.order(title: :asc).pluck(:title)
  end
end
