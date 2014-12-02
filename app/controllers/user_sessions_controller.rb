class UserSessionsController < ApplicationController
  before_filter :require_login, only: [:destroy]

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password], params[:remember])
      redirect_to(root_path, notice: 'Login successful')
	  session[:registered_user] = @user.username
    else
      flash.now[:alert] = "Login failed"
      render action: "new"
    end
  end

  def destroy
    logout
    redirect_to(root_path, notice: 'Logged out!')
  end
end
