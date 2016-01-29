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
end
