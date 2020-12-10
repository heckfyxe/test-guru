class QuestionsController < ApplicationController
  before_action :find_test
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  def index
    render plain: @test.questions.pluck(:text).join("\n")
  end

  def show
    render plain: @question.text
  end

  def new; end

  def edit; end

  def create
    question = Question.new(params.require(:question).permit(:text))
    question.test = @test
    question.save!
    render plain: question.inspect
  end

  def destroy
    @question.destroy
    render plain: 'Successfully deleted'
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = @test.questions.find(params[:id])
  end

  def rescue_with_record_not_found
    render plain: 'Not found'
  end
end
