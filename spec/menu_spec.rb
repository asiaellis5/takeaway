require 'menu'

describe Menu do
  let(:items){ {Pizza: 10, Chicken: 6, Chips: 3} }
  let(:subject){described_class.new(items)}

  describe "#show_menu" do
    it "shows a list of items and prices" do
      expect(subject.show_menu).to eq "Pizza: £10\n Chicken: £6\n Chips: £3"
    end
  end
  
end