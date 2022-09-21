require 'securerandom'
require_relative './item'

class Source < Item
  attr_accessor :name

  def initialize(name, publish_date)
    super(publish_date)
    @id = SecureRandom.hex(5)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    # item.source = self
  end
end
