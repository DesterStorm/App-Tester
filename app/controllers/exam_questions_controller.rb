class ExamQuestionsController < ApplicationController
  attr_accessor :description
  before_action :set_exam_question, only: [:show, :edit, :update, :destroy]

  def new
    @exam_questions = ExamQuestion.new
  end

  def create
    @exam = Exam.find_by(params[:id])
    @exam_questions = @exam.exam_questions.build(exam_question_params)

    if @exam_questions.save!

      redirect_to @exam_questions
    else
      render 'new'
    end
  end

  def show
  end

  def update
    if @exam_questions.update_attributes(exam_question_params)
      redirect_to @exam_questions, notice: "Successfully updated exam_questions."
    else
      render 'edit'
    end
  end

  def edit
  end

  def destroy
    @exam_questions.destroy
    redirect_to exam_questions_path, notice: "Successfully destroyed exam_question."
  end

  def set_exam_question
    @exam_questions = ExamQuestion.find(params[:id])
  end

  def exam_question_params
    params.permit(:exam_id, :description, exam_answers_attributes:[:letter, :answer, :correct])
  end
end
