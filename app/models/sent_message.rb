class SentMessage < ActiveRecord::Base
  belongs_to :message

  validates :intro, presence: true
  validates :body, presence: true
  validates :ending, presence: true

  ACCOUNT_SID = 'AC01b6404ed79574caed356c0e13d652ed' 
  AUTH_TOKEN = 'a19da2c5470eea4fa932ae69c57ebb71'

  def message_maker(recipient, sender)
    p intro
    intro_string = Message.find(intro).text
    body_string = Message.find(body).text
    ending_string = Message.find(ending).text

    "Dear #{recipient} " + "#{intro_string} " + "#{body_string} " + "#{ending_string} " + "from #{sender}."
  end


  def send_sms(phone_number, alert_message) 
    @twilio_number = +12048185591
    @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN

    unless phone_number.empty?
      message = @client.account.messages.create(
        :from => @twilio_number,
        :to => phone_number,
        :body => alert_message
      )
      puts message.to
    end
  end


  def send_mail(recipient, sender, message)
    # SENDGRID CREDENTIALS
    # Enter in your SendGrid username and 
    # password below.
    #===========================================#
    sg_username = "robospice"
    sg_password = "breakup2016"

    # CREATE THE MAIL OBJECT
    #===========================================#
    client = SendGrid::Client.new(api_user: sg_username, api_key: sg_password)

    email = SendGrid::Mail.new do |m|
    m.to = recipient.to_s
    m.from = "RoboSpice@robospice.com"
    m.from_name = sender.to_s
    m.subject = "It's not you..."
    m.text = message.to_s
    end
    # SEND THE EMAIL
    #===========================================#
    client.send(email) 
  end

  def self.recent_messages
    order('created_at DESC').limit(9)
  end
end