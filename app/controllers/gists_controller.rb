class GistsController < ApplicationController
  def create
    test_passage = TestPassage.find(params[:test_passage_id])
    question = test_passage.current_question
    service = GistQuestionService.new(question)
    result = service.call

    flash_options = if service.success?
                      Gist.create!(question: question, url: result.html_url, user: current_user)
                      { notice: "Gist успешно создан. Ссылка на gist: #{result.html_url}" }
                    else
                      { alert: 'Gist не был создан' }
                    end

    redirect_to test_passage, flash_options
  end
end
