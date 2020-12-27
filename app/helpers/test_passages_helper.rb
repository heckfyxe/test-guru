module TestPassagesHelper
  def question_number(test_passage)
    test_passage.test.questions.pluck(:id).index(test_passage.current_question.id) + 1
  end

  def questions_count(test_passage)
    test_passage.test.questions.count
  end

  def success_percent(test_passage)
    (test_passage.correct_answers_count * 100.0 / test_passage.test.questions.count).round
  end

  def success?(test_passage)
    success_percent(test_passage) >= 85
  end
end
