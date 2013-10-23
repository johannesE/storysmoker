class UsersController < ApplicationController
  def register
end

  def login
  end

def create
  @user = User.new(params[:user])
end


end