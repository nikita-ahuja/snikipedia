class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_login, only: [:new, :create]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    # @posts=Post.all # needed for sidebar, probably better to use a cell for this
    respond_to do |format|
      # format.html { redirect_to @user, notice: 'Welcome!' }
      # format.json { render :show, status: :ok, location: @user }
      format.html # show.html.erb
      format.js # show.js.erb
    end

  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to @user, notice: 'Thank you for signing up!' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { redirect_to signup_path, notice: "Invalid Registration Information.  Please try again." }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @user == @current_user
      session[:user_id] = nil
      @user.destroy
      respond_to do |format|
        format.html { redirect_to root_url, notice: 'User was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      @user.destroy
      respond_to do |format|
        format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
