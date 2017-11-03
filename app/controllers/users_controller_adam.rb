class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_login, only: [:new, :create]



  def index
    @users = User.all
  end

  def show

    # @user = User.find_by(id: session[:user_id])
    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.js # show.js.erb
    # end
  end

  def new
    @user = User.new
  end

  def edit
  end


  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'Thank you for signing up!'
      # redirect_to "/users/login"
    else
      render :new
      # render "signup"
    end
  end


  def signup
    @user = User.new
  end

  # def
  #   @user = User.find_by(username: params[:user][:username])
  #   if @user.password == params[:user][:password]
  #     session[:user_id] = @user.id
  #     redirect_to @user
  #   else
  #     render "login"
  #   end
  # end




  def login
  end

  def destroy
  end



  private

  def set_user
    @user = User.find(params[:id])
  end


  def user_params
    params.require(:user).permit(:email, :username, :password)
  end

end
