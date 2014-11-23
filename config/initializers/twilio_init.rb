
require 'twilio-ruby'

# put your own credentials here.  These should ultimately go in environment variables, but I'm lazy and don't want to set those up right now.  

account_sid = 'AC95b7171e3c74ba75bd12e77188cb958c'
auth_token = '0b2eb5d99e7c55225b7619228c75e3aa'


# Preconfigure the client like so
Twilio.configure do |config|
  config.account_sid = account_sid
  config.auth_token = auth_token
end

# and then you can create a new client without parameters like so.
# except we are going to do this in the twilio controller
# @client = Twilio::REST::Client.new