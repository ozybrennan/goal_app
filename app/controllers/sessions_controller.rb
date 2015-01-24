class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(
    user_params[:username],
    user_params[:password]
    )
    if @user
      log_in(@user)
      redirect_to goals_url
    else
      @user = User.new(user_params)
      render :new
    end
  end

  def destroy
    @user = current_user
    @user.reset_session_token
    redirect_to(new_session_url)
  end

end
