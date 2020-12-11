class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  def index
    render plain: @test.questions.pluck(:text).join("\n")
  end

  def show
    render plain: @question.text
  end

  def new; end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :new
    end
  end

  def create
    @question = Question.new(question_params)
    @question.test = @test
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    render plain: 'Successfully deleted'
  end

  private

  def question_params
    params.require(:question).permit(:text)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_record_not_found
    render plain: 'Not found'
  end
end
