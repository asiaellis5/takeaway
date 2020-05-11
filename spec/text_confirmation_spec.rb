require 'text_confirmation'

describe TextConfirmation do 

 let(:subject){described_class.new}

 let(:client) { double :client }
 let(:message) { "Thank you! Your order was placed and will be delivered before #{(Time.now + (60 * 60)).strftime("%k:%M")}, total cost: £10" }

 it "sends text with order details" do
   twilio_message_body = { body: message , from: ENV["FROM"], to: ENV["TO"],  }
   allow(client).to receive_message_chain(:messages, :create).with(twilio_message_body)
   expect(Twilio::REST::Client).to receive(:new).with(ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']).and_return(client)
   subject.send_message('£10')
 end

  it "sends text with order details" do
    expect(subject).to receive(:send_message)
    subject.send_message('£10')
  end

  
end