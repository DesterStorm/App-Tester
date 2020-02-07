class JobPost < ApplicationRecord
  belongs_to :client, optional: true
  has_many :exams, -> { order "created_at DESC"}, dependent: :destroy, :inverse_of => :job_post
  has_many :tests, through: :exams
  has_many :users, through: :tests
end
