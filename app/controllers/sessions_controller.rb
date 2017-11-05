class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    respond_to do |format|
      if user && user.authenticate(params[:password])
        session[:user_id] = @user.id
        format.html { redirect_to @user, notice: "Welcome back, #{user.username.capitalize}!" }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { redirect_to login_path, notice: "Username or Password not recognized." }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out!'

    #  respond_to do |format|
    #    format.html { redirect_to root_url, notice: 'Logged out!' }
    #    format.js { redirect_to root_url, notice: 'Logged out!' }
    #  end

  end

end
