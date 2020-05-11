class Order

  attr_reader :basket

  def initialize(menu = Menu.new(items))
    @menu = menu
    @basket = {}
  end

  def select_item(item, quantity)
    raise "Item unavailable!" if !item_included_in_menu?(item.to_sym)
    if !item_included_in_basket?(item)
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

  private

  def item_included_in_menu?(item)
    @menu.items.has_key?(item.to_sym)
  end

  def item_included_in_basket?(item)
    @basket.has_key?(item.to_sym)
  end
end