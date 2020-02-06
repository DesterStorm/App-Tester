require "pry"

class ExamAnswersController < ApplicationController
  def index
    @exam_answers = ExamAnswer.all.order("created_at DESC")
  end

  def new
    @exam_answers = ExamAnswer.new
    @exam = Exam.find(params[:id])
    @exam_answers.exam_id = @exam
  end

  def create
    @exam_answers = ExamAnswer.new(exam_answer_params)
    if @exam_answers.save!
      redirect_to @exam_answers
    else
      render 'new'
    end
  end

  def show
    @exam_answers = ExamAnswer.find(params[:id])
  end

  def update
    @exam_answers = ExamAnswer.find(params[:id])
    if @exam_answers.update_attributes(exam_answer_params)
      redirect_to @exam_answers, notice: "Successfully updated exam_answer."
    else
      render 'edit'
    end
  end

  def edit
    @exam_answers = ExamAnswer.find(params[:id])
  end

  def destroy
    @exam_answers = ExamAnswer.find(params[:id])
    @exam_answers.destroy
    redirect_to exam_answers_path, notice: "Successfully destroyed exam_answer."
  end

  def exam_answer_params
    params.require(:exam_answer).permit(:exam_question_id, :exam_id, :letter, :correct, :answer)
  end
end