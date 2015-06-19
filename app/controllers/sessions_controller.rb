class SessionsController < ApplicationController



 def create
   @user = User.find_by(email: params["email"])
   if @user && @user.authenticate(params["password"])
     session[:user_id] =@user.id
     #flash[:message] ="login Successful"
     redirect_to '/home'
     #flash[:message] ="login Successful"
   else
     flash.now[:message] = "Incorrect Username or Password"
     render :new
   end
 end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end


end


