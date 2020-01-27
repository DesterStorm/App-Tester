class JobPost < ApplicationRecord
  belongs_to :client, optional: true
  has_many :exams
  has_many :tests, through: :exams
  has_many :users, through: :tests
end
