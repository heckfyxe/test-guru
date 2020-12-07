class Answer < ApplicationRecord
  scope :right_answers, -> { where(correct: true) }

  belongs_to :question

  validates :text, presence: true
  validate :validate_answers_count, on: :create

  def validate_answers_count
    puts question.answers.count
    errors.add(:base, 'Answers count must be from 1 to 4') unless (1...4).include?(question.answers.count)
  end
end
