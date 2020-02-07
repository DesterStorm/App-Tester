class UsersController < ApplicationController

  def show
    @user = current_user
    @user.id = current_user.id
  end

end
