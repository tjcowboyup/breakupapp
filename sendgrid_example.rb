
#
# SendGrid Ruby Example
#
# This example shows how to send email through SendGrid
# using Ruby and the SendGrid Ruby gem.  See the 
# library's Github page for more information:
#
#     https://github.com/sendgrid/sendgrid-ruby
#
# To install the gem, run:
#
#     gem install sendgrid-ruby
#
# Or include it in your Gemfile like so:
#
#     gem install sendgrid-ruby
#
# 

require 'sendgrid-ruby'

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
  m.to = "test@testing.com"
  m.from = ""
  m.subject = "It's not you..."
  m.text = "Hello,\n\nThis is a test message from SendGrid.    We have sent this to you because you requested a test message be sent from your account.\n\nThis is a link to google.com: http://www.google.com\nThis is a link to apple.com: http://www.apple.com\nThis is a link to sendgrid.com: http://www.sendgrid.com\n\nThank you for reading this test message.\n\nLove,\nYour friends at SendGrid"
  m.html = "<table style=\"border: solid 1px #000; background-color: #666; font-family: verdana, tahoma, sans-serif; color: #fff;\"> <tr> <td> <h2>Hello,</h2> <p>This is a test message from SendGrid.    We have sent this to you because you requested a test message be sent from your account.</p> <a href=\"http://www.google.com\" target=\"_blank\">This is a link to google.com</a> <p> <a href=\"http://www.apple.com\" target=\"_blank\">This is a link to apple.com</a> <p> <a href=\"http://www.sendgrid.com\" target=\"_blank\">This is a link to sendgrid.com</a> </p> <p>Thank you for reading this test message.</p> Love,<br/> Your friends at SendGrid</p> <p> <img src=\"http://cdn1.sendgrid.com/images/sendgrid-logo.png\" alt=\"SendGrid!\" /> </td> </tr> </table>"
end




# SEND THE EMAIL
#===========================================#
puts client.send(email)
