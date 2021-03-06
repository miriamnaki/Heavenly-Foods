class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def redirect_unless_signed_in
    redirect_to new_session_path unless current_user
  end
end
