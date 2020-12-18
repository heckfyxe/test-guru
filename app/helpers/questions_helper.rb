module QuestionsHelper
  def question_header(test, question)
    if question.persisted?
      "Edit #{test.title} question"
    else
      "Create New #{test.title} question"
    end
  end
end
