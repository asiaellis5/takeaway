require 'twilio-ruby'
require 'dotenv'
Dotenv.load('.env')

 class TextConfirmation

  def initialize
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']  
    @client = Twilio::REST::Client.new account_sid, auth_token
    @from = ENV['FROM']
    @to = ENV['TO']
  end

def send_message
  message = @client.messages.create(
    body: "Thank you! Your order was placed and will be delivered before #{Time.now + 3600}",
    to: @to, 
    from: @from )
end

end

TextConfirmation.new.send_message
