module QuestionsHelper
  def question_header(test, question)
    if question.persisted?
      t(:edit_question, test_title: test.title)
    else
      t(:create_question, test_title: test.title)
      "Create New #{test.title} question"
    end
  end
end
