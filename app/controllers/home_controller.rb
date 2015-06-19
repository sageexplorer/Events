class HomeController < ApplicationController

  #before_action :authorize

  def home
    @events = Event.all
    @users = User.all
  end

end