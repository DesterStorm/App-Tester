class TestAnswerSerializer < ActiveModel::Serializer
  attributes :id
  has_one :test
  has_one :exam_answer
end
