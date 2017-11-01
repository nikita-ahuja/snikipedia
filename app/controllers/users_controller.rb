class UsersController < ApplicationController

  def index
  end

  def signup
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render "signup"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def login
    @user = User.new
  end

  private
    def user_params
      params.require(:user).permit(:email, :username, :password_hash)
    end

end
