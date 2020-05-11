class Order

  attr_reader :basket

  def initialize(menu = Menu.new(items))
    @menu = menu
    @basket = {}
  end

  def select_item(item, quantity)
    raise "Item unavailable!" if !@menu.items.include?(item.to_sym)
    if !@basket.has_key?(item.to_sym)
    @basket[item.to_sym] = quantity
    else 
      @basket[item.to_sym] += quantity
    end
  end

  def total
    total = @basket.map do |item, quantity|
      @menu.price(item) * quantity
    end
    "£#{total.reduce(:+)}"
  end
end