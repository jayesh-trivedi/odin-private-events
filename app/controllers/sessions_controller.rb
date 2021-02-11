class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: session_params[:username])
    if user
      session[:current_user_id] = user.id
      redirect_to user_path(session[:current_user_id])
    else
      render "new"
    end
  end

  def destroy
    reset_session
    redirect_to new_session_path
  end

  private

  def session_params
    params.require(:user).permit(:username)
  end
end
