module GistsHelper
  def link_to_gist_question(gist)
    question = gist.question
    text = question.text[0...25]
    link_to text, admin_question_path(question)
  end

  def link_to_gist(gist)
    text = gist.url.split('/').last
    link_to text, gist.url
  end
end
