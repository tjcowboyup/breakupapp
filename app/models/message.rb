require 'twilio-ruby' 
require 'sendgrid-ruby'
 
class Message < ActiveRecord::Base
  has_many :sent_messages

  def self.generator(spicy)
    @message_array = []
    @message_array << where(spice: spicy, section: "intro").order("RANDOM()").first
    @message_array << where(spice: spicy, section: "body").order("RANDOM()").first
    @message_array << where(spice: spicy, section: "ending").order("RANDOM()").first
  end
end
