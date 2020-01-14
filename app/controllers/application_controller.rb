# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def can_administer?
    current_user.try(:admin?)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name birthday address])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name birthday address])
  end
end
