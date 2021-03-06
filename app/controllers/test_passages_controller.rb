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

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def answer_ids
    params[:answer_ids]
  end
end
