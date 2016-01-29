require 'twilio-ruby' 
 

class Message < ActiveRecord::Base
  has_many :sent_messages

  ACCOUNT_SID = 'AC01b6404ed79574caed356c0e13d652ed' 
  AUTH_TOKEN = 'a19da2c5470eea4fa932ae69c57ebb71'

  def self.intro_generator(spicy)
    where(spice: spicy, section: "Intro").order("RANDOM()").first
  end

  def self.body_generator(spicy)
    where(spice: spicy, section: "Body").order("RANDOM()").first
  end

  def self.ending_generator(spicy)
    where(spice: spicy, section: "Ending").order("RANDOM()").first
  end

  def self.message_maker(recipient, sender, intro, body, ending)
    "Dear #{recipient} " + "#{intro} " + "#{body} " + "#{ending} " + "from #{sender}."
  end

  def self.send_sms(phone_number, alert_message) 
    @twilio_number = +12048185591
    @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN

    message = @client.account.messages.create(
      :from => @twilio_number,
      :to => phone_number,
      :body => alert_message
    )
    puts message.to
  end
end