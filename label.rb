require 'securerandom'
require 'items'

class Label < Item
  attr_accessor :items, :color, :title
  attr_reader :id

  def initialize(title, color, publish_date)
    super(publish_date)
    @id = SecureRandom.hex(5)
    @title = title
    @color = color
    @items = []
  end

  def add_items(item)
    @items << item
    # item.label = self
  end
end
