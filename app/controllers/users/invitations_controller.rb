class Users::InvitationsController < Devise::InvitationsController
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def edit
    super
  end

  def update
    binding.pry
    super
  end

  def after_accept_path_for
    job_posts_path
  end

  def after_sign_in_path_for(resource)
    super resource
  end

  private

  def current_inviter

  end

  def authenticate_inviter!
    unless current_client
      redirect_to and return root_path, :alert => "Access Denied"
    end
  end

  # this is called when creating invitation
  # should return an instance of resource class
  #def invite_resource
  #  # skip sending emails on invite
  #  super { |user| user.skip_invitation = true }
  #end

  # this is called when accepting invitation
  # should return an instance of resource class
  def accept_resource
    update_sanitized_params
    puts "accept_resource called with params: #{update_resource_params}"
    super
  end

  protected

  def update_sanitized_params
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:first_name, :last_name, :email, :password, :password_confirmation, :invitation_token])
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:accept_invitation) do |u|
      u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :invitation_token)
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[EIN phone address company_name email])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[EIN phone address company_name email])
    devise_parameter_sanitizer.permit(:invite, keys: [:first_name, :last_name, :email])
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:first_name, :last_name, :email])
    params.permit!
  end
end