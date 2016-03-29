require 'twilio-ruby'



def calculate(message, phone)
  account_sid = 'AC8b0a0fa81e3da83139a539e6f35e0aa0'
  auth_token = '498edb1d855606b977eaa49efa6d7e50'
  @client = Twilio::REST::Client.new account_sid, auth_token
  message = @client.account.messages.create(:body => message,
                                            :to => "+1#{phone}",
                                            :from => "3237989892"
  )
  puts message.to
end

calculate("hello", "3109932871")