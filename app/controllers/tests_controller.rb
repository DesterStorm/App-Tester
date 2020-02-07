class TestsController < ApplicationController

  def index
    @tests = Test.all.order("created_at DESC")
  end

  def new
    @exam = Exam.find(params[:exam_id])
    @test = @exam.tests.build
    @exam.exam_questions.each do |exam_question|
      @test.test_answers.build(:exam_question_id => exam_question.id)
    end
  end

  def create
    @exam = Exam.find(params[:exam_id])
    @exam.user_ids = current_user.id
    @test = Test.find_or_initialize_by(params[:exam => :exam_id])
    @test.exam_id = @exam.id
    @test.score = 0
    # binding.pry
    if @test.test_answers
      @test.increment!(:score, 1)
    else
      @test.increment!(:score, -1)
    end
    if @test.save
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

  def test_answer_params
    params.permit(:exam_answer_id, :test_id)
  end

  def test_params
    params.require(:test).permit(:exam_id, :user_id, test_answers_attributes: [:exam_answer_id, :exam_question_id])
  end
end
