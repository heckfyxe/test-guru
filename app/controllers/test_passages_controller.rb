class TestPassagesController < ApplicationController
  before_action :find_test_passage

  def show
    @progress = @test_passage.progress
  end

  def result
    @result = @test_passage.result
  end

  def update
    @test_passage.accept!(answer_ids)
    if @test_passage.completed?
      redirect_to result_test_passage_path(@test_passage)
    else
      redirect_to test_passage_path(@test_passage)
    end
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def answer_ids
    params[:answer_ids]
  end
end
