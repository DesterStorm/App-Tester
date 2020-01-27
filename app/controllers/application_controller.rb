# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token
  before_action :configure_permitted_parameters, if: :devise_controller?

  def is_client?
    current_user.class == Client
  end

  def is_user?
    current_user.class == User
  end

  protected

  def authenticate_inviter!
    authenticate_client!(force: true)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[EIN phone address company_name email])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[EIN phone address company_name email])
    devise_parameter_sanitizer.permit(:invite, keys: [:first_name, :last_name, :email, :password, :password_confirmation, :invitation_token])
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:first_name, :last_name, :email, :password, :password_confirmation, :invitation_token])
    params.permit!
  end
end
