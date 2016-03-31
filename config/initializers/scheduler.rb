require 'rufus-scheduler'



class Schedule < EventsController

  @message = EventsController.new
  #scheduler = Rufus::Scheduler.singleton
  scheduler = Rufus::Scheduler.start_new
  scheduler.every("50s") do
  @message.send_now
  #puts "hey"
  #scheduler.cron '00 012 * * *' do
    #9 am
  end

end

#
#desc "This task is called by the Heroku scheduler add-on"
#task :send_email do
#  @message = EventsController.new
#  @message.send_now
#end
