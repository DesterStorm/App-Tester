class ExamAnswersController < ApplicationController
  def create
    params["answers"].each do |key, value|
      @exam_answer = ExamAnswer.create(exam_answer_params(value))
    end

    respond_to do |format|
      if @exam_answer.save
        delete_written
        format.html { redirect_to exam_url(@exam), notice: 'Exam answers were successfully created.' }
        format.json { render :show, status: :created, location: @exam_answer }
      else
        format.html { render :new }
        format.json { render json: @exam_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete_written
    AssessmentAnswer.where(letter: nil).delete_all
  end

  def exam_answer_params(answers)
    answers.permit(:letter, :answer, :correct, :exam_question_id, :exam_id)
  end
end