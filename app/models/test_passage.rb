class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  validates :correct_answers_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
