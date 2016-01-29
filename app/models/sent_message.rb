class SentMessage < ActiveRecord::Base
  belongs_to :message

  validates :intro, presence: true
  validates :body, presence: true
  validates :ending, presence: true

  ACCOUNT_SID = 'AC01b6404ed79574caed356c0e13d652ed' 
  AUTH_TOKEN = 'a19da2c5470eea4fa932ae69c57ebb71'

  def message_maker(recipient, sender, intro, body, ending)
    "Dear #{recipient} " + "#{intro} " + "#{body} " + "#{ending} " + "from #{sender}."
  end

  def send_sms(phone_number, alert_message) 
    @twilio_number = +12048185591
    @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN

    message = @client.account.messages.create(
      :from => @twilio_number,
      :to => phone_number,
      :body => alert_message
    )
    puts message.to
  end

  def self.recent_messages
    
  end
end