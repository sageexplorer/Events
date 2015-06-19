class EventsController < ApplicationController

  #before_action :authorize


  def new
    if not current_user
      redirect_to '/login'
    else
      #@event = Event.new
      @event = Event.new
      @user = User.all

    end
  end


  def create
    @event = Event.new(event_params)
    #event  = event_params
    #@user  = current_user[:user_id]
    #@event = @user.events.build(event)
    user = current_user[:id]
    @event.user_id= user
    #@event = user.events.build(params[:event])
    if @event.save
      redirect_to "/home"
    else
      flash[:message] = "All fields are required"
      render :new
    end
  end

  def show

  end



 #TODO SUGGEST ALGO HERE


  def destroy
    @event=Event.find_by(params[:id])
    @event.delete
    redirect_to "/"
    end

  private
  def event_params
    params.require(:event).permit(:name, :day, :id, :time, :user_id, :place, :suggest, :comment)
  end

end