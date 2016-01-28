require 'twilio-ruby' 
 
def send_message(phone_number, alert_message) 

account_sid = 'AC01b6404ed79574caed356c0e13d652ed' 
auth_token = 'a19da2c5470eea4fa932ae69c57ebb71'
@twilio_number = +12048185591


@client = Twilio::REST::Client.new account_sid, auth_token

message = @client.account.messages.create(
  :from => @twilio_number,
  :to => phone_number,
  :body => "alert_message"
)
puts message.to

end