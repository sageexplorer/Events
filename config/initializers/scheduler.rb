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