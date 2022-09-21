require 'securerandom'
require './item'

class Genre < Item
  attr_accessor :id, :name, :items

  def initialize(name, publish_date)
    super(publish_date)
    @id = SecureRandom.hex(5)
    @name = name
    @items = []
  end

  def add_items(item)
    @items << item
    # item.genre = self
  end
end
