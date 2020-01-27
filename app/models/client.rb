class Client < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  include DeviseInvitable::Inviter

  has_many :applicants, class_name: "User"
  has_many :job_posts
  has_many :exams, through: :job_posts
  has_many :exam_questions, through: :exams
end
