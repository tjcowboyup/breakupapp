require 'twilio-ruby' 
 
def send_sms(phone_number, alert_message) 

ACCOUNT_SID = 'AC01b6404ed79574caed356c0e13d652ed' 
AUTH_TOKEN = 'a19da2c5470eea4fa932ae69c57ebb71'
@twilio_number = +12048185591
@client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN

message = @client.account.messages.create(
  :from => @twilio_number,
  :to => phone_number,
  :body => "alert_message"
)
puts message.to

end