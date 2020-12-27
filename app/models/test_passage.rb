class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', foreign_key: :current_question_id, optional: true

  validates :correct_answers_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  before_create :before_create_set_first_question
  before_update :before_update_set_next_question

  class Progress
    attr_reader :question_number, :questions_count

    def initialize(question_number, questions_count)
      @question_number = question_number
      @questions_count = questions_count
    end
  end

  class Result
    attr_reader :percent

    def initialize(success, percent)
      @success = success
      @percent = percent
    end

    def success?
      @success
    end
  end

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    return if answer_ids.nil?

    self.correct_answers_count += 1 if correct_answer?(answer_ids)

    save!
  end

  def progress
    Progress.new(current_question_number, questions_count)
  end

  def result
    Result.new(success_percent >= 85, success_percent)
  end

  private

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def next_question
    test.questions.order(id: :asc).find_by('id > ?', current_question.id)
  end

  def correct_answers
    current_question.answers.right_answers
  end

  def current_question_number
    test.questions.pluck(:id).index(current_question.id) + 1
  end

  def questions_count
    test.questions.count
  end

  def success_percent
    (correct_answers_count * 100.0 / test.questions.count).round
  end

  def before_create_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_update_set_next_question
    self.current_question = next_question
  end
end
