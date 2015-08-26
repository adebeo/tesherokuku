class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_auth

  private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  helper_method :current_user
  
  
  def set_auth
    @auth = session[:omniauth] if session[:omniauth]
  end
  
  protected
    def authenticate_user!
      if current_user
      else
        redirect_to '/' #, :notice => ''
      end
    end
  
  
end
