class ExamAnswersController < ApplicationController
  def index
    @exam_answers = ExamAnswer.all.order("created_at DESC")
  end

  def new
    @exam_answer = ExamAnswer.new
    @exam = Exam.find(params[:id])
  end

  def create
    @exam_answer = ExamAnswer.new(exam_answer_params)
    if @exam_answer.save!
      redirect_to @exam_answer
    else
      render 'new'
    end
  end

  def show
    @exam_answer = ExamAnswer.find(params[:id])
  end

  def update
    @exam_answer = ExamAnswer.find(params[:id])
    if @exam_answer.update_attributes(exam_answer_params)
      redirect_to @exam_answer, notice: "Successfully updated exam_answer."
    else
      render 'edit'
    end
  end

  def edit
    @exam_answer = ExamAnswer.find(params[:id])
  end

  def destroy
    @exam_answer = ExamAnswer.find(params[:id])
    @exam_answer.destroy
    redirect_to exam_answers_path, notice: "Successfully destroyed exam_answer."
  end

  private

  def exam_answer_params
    params.require(:exam_answer).permit(:exam_question_id, :exam_id)
  end
end