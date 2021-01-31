class Admin
  class TestsController < Admin::BaseController
    before_action :set_test, only: %i[show start edit update destroy]

    def index
      @tests = Test.all
    end

    def show
      find_questions
    end

    def new
      @test = Test.new
    end

    def edit; end

    def create
      @test = Test.new(test_params)
      @test.author = current_user

      if @test.save
        redirect_to admin_test_path(@test)
      else
        render :new
      end
    end

    def update
      if @test.update(test_params)
        redirect_to admin_test_path(@test)
      else
        render :edit
      end
    end

    def destroy
      @test.destroy
      redirect_to admin_tests_path
    end

    def start
      current_user.tests.push(@test)
      redirect_to current_user.test_passage(@test)
    end

    private

    def set_test
      @test = Test.find(params[:id])
    end

    def test_params
      params.require(:test).permit(:title, :level, :category_id)
    end

    def find_questions
      @questions = @test.questions
    end
  end
end