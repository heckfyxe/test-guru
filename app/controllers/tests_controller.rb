class TestsController < ApplicationController
  def index
    @tests = Test.all
  end

  def show
    find_test
    find_questions
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def find_questions
    @questions = @test.questions
  end
end
