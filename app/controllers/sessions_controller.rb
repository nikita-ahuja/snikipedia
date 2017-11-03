class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user, notice: 'Logged in!'
    else
      flash.now.alert = 'Email or password is invalid'
      render :new
    end
  end


  # def create
  #   user = User.find_by(email: params[:email])
  #
  #   respond_to do |format|
  #     if user && user.authenticate(params[:password])
  #       session[:user_id] = user.id
  #       format.html { redirect_to user, notice: 'Logged in!' }
  #       format.json { render :show, status: :created, location: @user }
  #     else
  #       flash.now.alert = 'Email or password is invalid'
  #       render :new
  #       # format.html { render :new, notice: 'Email or password is invalid'}
  #       # format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end


  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out!'

    #  respond_to do |format|
    #    format.html { redirect_to root_url, notice: 'Logged out!' }
    #    format.js { redirect_to root_url, notice: 'Logged out!' }
    #  end

  end

end
