require 'text_confirmation'

describe TextConfirmation do 

 let(:subject){described_class.new}

  it "sends text with order details" do
    expect(subject).to receive(:send_message)
    subject.send_message
  end

  
end