require 'securerandom'
require 'items'

class Label < Item
  attr_accesor :items, :color, :title
  def initialize(id: SecureRandom.hex(5), title, color, items: [])
    @id = id
    @title = title
    @color = color
    @items = items
  end

  def add_items
    @items << Item.new()
  end
end