class TestsController < ApplicationController
  before_action :find_test, only: %i[show start]

  def index
    @tests = Test.all
  end

  def show
    find_questions
  end

  def start
    find_user
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def find_user
    @user = User.first
  end

  def find_questions
    @questions = @test.questions
  end
end
