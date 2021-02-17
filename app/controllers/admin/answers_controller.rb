class Admin
  class AnswersController < ApplicationController
    before_action :find_question, only: %i[new create]
    before_action :find_answer, except: %i[new create]

    rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_record_not_found

    def show; end

    def new
      @answer = Answer.new
    end

    def create
      @answer = Answer.new(answer_params)
      @answer.question = @question

      if @answer.save
        redirect_to_question
      else
        render :new
      end
    end

    def edit; end

    def update
      if @answer.update(answer_params)
        redirect_to_question
      else
        render :edit
      end
    end

    def destroy
      @answer.destroy
      redirect_to_question
    end

    private

    def redirect_to_question
      redirect_to admin_question_path(@answer.question)
    end

    def answer_params
      params.require(:answer).permit(:text, :correct)
    end

    def find_question
      @question = Question.find(params[:question_id])
    end

    def find_answer
      @answer = Answer.find(params[:id])
    end

    def rescue_from_record_not_found
      render plain: t(:not_found)
    end
  end
end
