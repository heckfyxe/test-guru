class Answer < ApplicationRecord
  scope :right_answers, -> { where(correct: true) }

  belongs_to :question

  validates :text, presence: true
end
