require 'securerandom'

class Source
  attr_accessor :name
  
  def initialize(name)
    @id = SecureRandom.hex(5)
    @name
    @items = []
  end

  def add_item(item)
    @items << item
    item.source = self
  end
end
