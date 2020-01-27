class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :confirmable, :omniauthable,
         omniauth_providers: [:facebook, :google_oauth2]

  #before_save :assign_client

  validates_confirmation_of :password

  def block_from_invitation?
    false
  end

  #belongs_to :client
  has_many :tests
  has_many :exams, through: :tests
  has_many :exam_answers, through: :exams
  has_and_belongs_to_many :job_posts

  #def assign_client
  #  self.client = self.invited_by
  #end

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

  #def block_from_invitation?
  #  # If the user has not been confirmed yet, we let the usual controls work
  #  if confirmed_at.blank?
  #    return invited_to_sign_up?
  #  else # if the user was confirmed, we let them in (will decide to accept or decline invitation from the dashboard)
  #    return false
  #  end
  #end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
    end
  end

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
