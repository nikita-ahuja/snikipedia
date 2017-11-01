class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
  end

  def signup
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path
    else
      render "signup"
    end
  end

  def login
    @user = User.new
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end

end
