require 'securerandom'
require 'items'

class Label < Item
  attr_accessor :items, :color, :title
  attr_reader :id

  def initialize(title, color)
    super
    @id = SecureRandom.hex(5)
    @title = title
    @color = color
    @items = []
  end

  def add_items
    @items << Item.new
  end
end
