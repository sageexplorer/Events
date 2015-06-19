class UsersController < ApplicationController

  def new
    @user = User.new
    @event = Event.inspect
  end


  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to "/home"
    else
      render :new
    end
  end






  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end



end