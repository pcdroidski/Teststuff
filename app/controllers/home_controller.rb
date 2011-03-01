class HomeController < ApplicationController
  def index
    @user = User.new
  end
  
  before_filter :redirect_to_when_logged 
  
  
  private
  
  
  def redirect_to_when_logged
    if current_user	  
      redirect_to user_path(:id => @current_user)
    else
      end
  end
  
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
