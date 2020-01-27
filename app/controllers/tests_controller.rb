class TestsController < ApplicationController
  def index
    @tests = Test.all.order("created_at DESC")
  end

  def new
    @test = Test.new
    #delegate :exam_answer, to: :test
    @test.exam_questions.each do |q|
      @test.exam_answers.build(exam_question:q)
    end
  end

  def create
    @test = Test.new(test_params)

    if @test.save!
      redirect_to @test
    else
      render 'new'
    end
  end

  def show
    @test = Test.find(params[:id])
  end

  def update
    @test = Test.find(params[:id])

    if @test.update(test_params)
      redirect_to @test
    else
      render 'edit'
    end
  end

  def edit
    @test = Test.find(params[:id])
  end

  def destroy
    @test = Test.find(params[:id])
    @test.destroy
    redirect_to tests_path
  end

  private

  def test_params
    params.require(:test).permit(:exam, :exam_answers)
  end
end
