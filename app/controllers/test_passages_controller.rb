class TestPassagesController < ApplicationController
  before_action :find_test_passage

  def show; end

  def result; end

  def update
    @test_passage.accept!(answer_ids)
    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    question = @test_passage.current_question
    result = GistQuestionService.new(question).call

    flash_options = if result.status == 201
                      Gist.create(question: question, url: result.data.html_url, user: current_user )
                      { notice: "Gist успешно создан. Ссылка на gist: #{result.data.html_url}" }
                    else
                      { alert: 'Gist не был создан' }
                    end

    redirect_to @test_passage, flash_options
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def answer_ids
    params[:answer_ids]
  end
end
