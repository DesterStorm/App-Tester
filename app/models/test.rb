class Test < ApplicationRecord
  belongs_to :user
  belongs_to :exam
  has_many :test_answers
end
