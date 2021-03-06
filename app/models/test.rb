class Test < ApplicationRecord
  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User', optional: true

  has_many :questions, dependent: :destroy

  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  validates :title, presence: true
  validates :title, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :duration_in_minutes, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true

  before_validation :duration_in_minutes, :before_validation_duration_in_minutes

  def self.test_titles_by_category_title(title)
    Category.find_by(title: title).tests.order(title: :asc).pluck(:title)
  end

  private

  def before_validation_duration_in_minutes
    self.duration_in_minutes = nil if duration_in_minutes.present? && duration_in_minutes.zero?
  end
end
