# Takeaway

## User Stories

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```

## Example

```
2.6.3 :001 > require './lib/order'
 => true
2.6.3 :002 > items = {Pizza: 10, Chicken: 6, Chips: 3}
 => {:Pizza=>10, :Chicken=>6, :Chips=>3}
2.6.3 :003 > menu = Menu.new(items)
 => #<Menu:0x00007f9e4c9daa48 @items={:Pizza=>10, :Chicken=>6, :Chips=>3}>
2.6.3 :004 > order = Order.new(menu)
 => #<Order:0x00007f9e4d241da8 @menu=#<Menu:0x00007f9e4c9daa48 @items={:Pizza=>10, :Chicken=>6, :Chips=>3}>, @basket={}>>
2.6.3 :005 > order.select_item("Pizza", 2)
 => 2
2.6.3 :006 > order.select_item("Chicken", 1)
 => 1
2.6.3 :007 > order.basket
 => {:Pizza=>2, :Chicken=>1}
2.6.3 :008 > order.select_item("Pizza", 2)
 => 4
2.6.3 :009 > order.basket
 => {:Pizza=>4, :Chicken=>1}
2.6.3 :010 > order.select_item("Fish", 1)
Traceback (most recent call last):
        5: from /Users/asiaellis/.rvm/rubies/ruby-2.6.3/bin/irb:23:in `<main>'
        4: from /Users/asiaellis/.rvm/rubies/ruby-2.6.3/bin/irb:23:in `load'
        3: from /Users/asiaellis/.rvm/rubies/ruby-2.6.3/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        2: from (irb):10
        1: from /Users/asiaellis/Projects/course-run-through/takeaway/lib/order.rb:15:in `select_item'
RuntimeError (Item unavailable!)
2.6.3 :011 > order.basket
 => {:Pizza=>4, :Chicken=>1}
2.6.3 :012 > order.complete_order
```
