class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception



  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def created_by(id)
    #@user = User.find_by_sql "SELECT email FROM users WHERE id=#{id}"
    #@user.inspect.match(/name.*>/).to_s.gsub(">","").to_s.gsub("name","")
    @user = User.find(id)[:email]

  end


  def suggest
    #@event = Event.find_by_sql "SELECT place FROM events HAVING (COUNT(place) > 1)"

  end


  helper_method :current_user, :created_by, :authorize, :suggest, :get_time


  def authorize
    flash[:message]= "You must login to do that!" unless current_user
    redirect_to '/' unless current_user
  end
end
