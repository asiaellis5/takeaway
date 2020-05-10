require 'order'

describe Order do
  let(:items){ {Pizza: 10, Chicken: 6, Chips: 3} }
  let(:menu){double :menu, :items => items}
  let(:order){described_class.new(menu)}

  describe "#select_item" do
    it "allows the user to select available items from the menu" do
      allow(menu).to receive(:include?).with(:Pizza).and_return(:true)
      allow(menu).to receive(:include?).with(:Chicken).and_return(:true)
      order.select_item("Pizza", 1)
      order.select_item("Chicken", 2)
      expect(order.basket).to eq(Pizza: 1, Chicken: 2)
    end

    it "throws an error if the item isnt available" do
      allow(menu).to receive(:include?).with(:kebab).and_return(:false)
      expect{ order.select_item("kebab", 2) }.to raise_error "Item unavailable!"
    end
  end

end