require 'twilio-ruby'
#require 'rufus-scheduler'


class EventsController < ApplicationController

  #before_action :authorize


  def new
    if not current_user
      redirect_to '/login'
    else
      @event = Event.new
      @user = User.all

    end
  end


  def create
    @event = Event.new(event_params)
    selected_day = params[:day]["day(1i)"].to_i
    selected_month = params[:day]["day(2i)"].to_i
    selected_year = params[:day]["day(3i)"].to_i
    @event["day"]= Date.new(selected_day, selected_month, selected_year)


    selected_hour = params[:time]["time(4i)"]
    selected_minute = params[:time]["time(5i)"]


    _time_ = "#{selected_hour}:#{selected_minute}"

    @event[:time]= _time_

    user = current_user[:id]
    @event.user_id= user
    if @event.save
      redirect_to "/home"
    else
      flash[:message] = "All fields are required"
      render :new
    end
  end


  def show
  end



  def today
    date = Time.now.strftime("%Y-%m-%d").to_s
    @message = Event.all
    return @message
  end


  def send_now
    date = "20"+Time.now.strftime("%y-%m-%d").to_s
    @message = Event.where(:day => "#{date}")
    time = Time.new
    time = time.strftime("%H:%M")
    @message.each do |t|
      if t[:time].strftime("%H:%M") == time
        message= t["suggest"]
        phone = t["place"]
        begin
          calculate(message, phone)
          sleep 3
        rescue
          puts "No messages to send"
        end
      end
    end
  end

  #This calculates when to send message
  def calculate(message, phone)
    account_sid = 'AC8b0a0fa81e3da83139a539e6f35e0aa0'
    auth_token = '498edb1d855606b977eaa49efa6d7e50'
    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.account.messages.create(:body => message,
                                              :to => "+1#{phone}",
                                              :from => "+18056284526"
    )
    puts message.to
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