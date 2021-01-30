class QuestionsController < ApplicationController
  before_action :find_test, only: %i[new create]
  before_action :find_question, except: %i[new create]
  before_action :find_question_test, except: %i[new create show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  def show; end

  def new
    @question = Question.new
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to_test
    else
      render :edit
    end
  end

  def create
    @question = Question.new(question_params)
    @question.test = @test
    if @question.save
      redirect_to_test
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    redirect_to_test
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

  def find_question_test
    @test = @question.test
  end

  def rescue_with_record_not_found
    render plain: 'Not found'
  end

  def redirect_to_test
    redirect_to admin_test_path(@test)
  end
end
