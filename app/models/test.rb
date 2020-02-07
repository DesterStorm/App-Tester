class Test < ApplicationRecord
  belongs_to :user
  belongs_to :exam
  has_many :test_answers
  accepts_nested_attributes_for :test_answers, :reject_if => :all_blank, :allow_destroy => true

end
