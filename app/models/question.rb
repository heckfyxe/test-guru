class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  validates :text, presence: true
  validate :validate_answer_count

  def validate_answer_count
    errors.add(:answers) unless (1..4).include?(answers.count)
  end
end
