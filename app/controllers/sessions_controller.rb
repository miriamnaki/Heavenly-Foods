class SessionsController < ApplicationController
  def new
  end

  def create
    @user= User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:alert] = "Welcome #{@user.first_name}"
      redirect_to root_path notice:'Welcome!'
      
      
    else
      flash[:alert] ='Wrong user name or password'
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path

  end


end
