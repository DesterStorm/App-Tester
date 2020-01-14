class ExamsController < ApplicationController
  def written
    prepare_meta_tags title: "Written Exam Test"
    set_meta_tags noindex: true
    @exam_questions = ExamQuestion.all
    @exam_options = ExamOption.all
    @empty_answers = []

    ExamQuestion.all.each do
      @empty_answers << ExamAnswer.new
    end
    render :layout => 'english'
  end

  def index
    @exams = Exam.all.order("created_at DESC")
  end

  def new
    @exam = Exam.new
  end

  def create
    @exam = Exam.new(exam_params)

    if @exam.save!
      redirect_to @exam
    else
      render 'new'
    end
  end

  def show
    @exam = Exam.find(params[:id])
  end

  def update
    @exam = Exam.find(params[:id])

    if @exam.update(exam_params)
      redirect_to @exam
    else
      render 'edit'
    end
  end

  def edit
    @exam = Exam.find(params[:id])
  end

  def destroy
    @exam = Exam.find(params[:id])
    @exam.destroy
    redirect_to exams_path
  end

    private

  def exam_params
    params.require(:exam).permit(:name, :content)
  end
end