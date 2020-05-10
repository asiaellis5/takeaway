class Menu

  attr_reader :items

  def initialize(items)
    @items = items
  end

  def show_menu
  menu = @items.map do |item, price|
     "#{item}: £#{price}"
    end
    return menu.join("\n ")
  end
end