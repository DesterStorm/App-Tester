class TestSerializer < ActiveModel::Serializer
  attributes :id
  has_one :exam
  has_one :user
end
