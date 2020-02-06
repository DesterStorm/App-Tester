class TestAnswersController < TestsController

  def create
    @test_answer = TestAnswer.new(test_answer_params)
    @test_answer.test_id = @test.id
    @test_answer.exam_answer_id = @exam.exam_answers.ids

    @test_answer.each do |a|
      @exam_answer = ExamAnswer.create(exam_answer_params(a))
    end

    if @test_answer.save
      delete_empty
    end
  end

  def delete_empty
    TestAnswer.where(letter: nil).delete_all
  end

  def test_answer_params
    params.permit(:exam_answer_id, :test_id)
  end
end
