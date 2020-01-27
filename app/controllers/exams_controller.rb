class ExamsController < ApplicationController

  def index
    @exams = Exam.all.order("created_at DESC")
  end

  def new
    @exam = Exam.new
    @job_post = JobPost.find(params[:id])
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
    if @exam.update_attributes(exam_params)
      redirect_to @exam, notice: "Successfully updated exam."
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
    redirect_to exams_path, notice: "Successfully destroyed exam."
  end

  private

  def exam_params
    params.require(:exam).permit(:exam_question, :exam_option, :exam_answer, :job_post_id)
  end
end