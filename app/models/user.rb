class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :confirmable, :omniauthable,
         omniauth_providers: [:facebook, :google_oauth2]

  validates_confirmation_of :password

  def block_from_invitation?
    false
  end

  has_many :tests
  has_many :exams, through: :tests
  has_many :test_answers, through: :tests
  accepts_nested_attributes_for :test_answers
  has_and_belongs_to_many :job_posts


  before_validation :set_provider
  def set_provider
    self[:provider] = "email" if self[:provider].blank?
  end

  before_validation :set_uid
  def set_uid
    self[:uid] = self[:email] if self[:uid].blank? && self[:email].present?
  end

  def confirmed_at
    self.confirmed_at = Time.now
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
