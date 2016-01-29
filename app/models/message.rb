require 'twilio-ruby' 
require 'sendgrid-ruby'
 
class Message < ActiveRecord::Base
  has_many :sent_messages

  def self.generator(spicy)
    @message_array = []
    @message_array << where(spice: spicy, section: "Intro").order("RANDOM()").first
    @message_array << where(spice: spicy, section: "Body").order("RANDOM()").first
    @message_array << where(spice: spicy, section: "Ending").order("RANDOM()").first
  end

  def self.send_mail(recipient, sender, message)
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

end
