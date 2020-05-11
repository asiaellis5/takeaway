require 'order'

describe Order do
  let(:items){ {Pizza: 10, Chicken: 6, Chips: 3} }
  let(:menu){double :menu, :items => items}
  let(:text){double :text_confirmation}
  let(:order){described_class.new(menu, text)}

  before(:each) do
    allow(menu).to receive(:price).with(:Chicken).and_return(6)
    allow(menu).to receive(:price).with(:Pizza).and_return(10)
  end

  describe "#select_item" do
    it "allows the user to select available items from the menu" do
      order.select_item("Pizza", 1)
      order.select_item("Chicken", 2)
      expect(order.basket).to eq(Pizza: 1, Chicken: 2)
    end

    it "allows the user to add multiple of the same item at different times" do
      order.select_item("Pizza", 1)
      order.select_item("Chicken", 2)
      order.select_item("Pizza", 5)
      expect(order.basket).to eq(Pizza: 6, Chicken: 2)
    end

    it "throws an error if the item isnt available" do
      expect{ order.select_item("kebab", 2) }.to raise_error "Item unavailable!"
    end
  end

  describe "#total_price" do
    it "accumulates the price of the order and keeps a running total" do
     
      order.select_item("Pizza", 1)
      order.select_item("Chicken", 2)
      expect(order.total).to eq "£22"
    end
  end

  describe "#complete_order" do
    it "completes the order, totalling it and sends confirmation text" do
      order.select_item("Pizza", 1)
      order.select_item("Chicken", 2)
      expect(text).to receive(:send_message).with("£22")
      order.complete_order
    end
  end

end