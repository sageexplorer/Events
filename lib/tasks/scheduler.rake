
desc "This task is called by the Heroku scheduler add-on"
task :send_sms  do
  puts "sending SMS..."
  @message = EventsController.new
  @message.send_now
  puts "done."
end
