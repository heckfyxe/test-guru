class TestsController < ApplicationController
  before_action :find_test, only: :show
  before_action :find_questions, only: :show

  def index
    @tests = Test.all
  end

  def show; end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def find_questions
    @questions = @test.questions
  end
end
