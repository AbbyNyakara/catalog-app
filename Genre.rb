require 'securerandom'
require './item'

class Genre < Item
  attr_accessor :id, :name, :items

  def initialize(name)
    super
    @id = SecureRandom.hex(5)
    @name = name
    @items = []
  end

  def add_items
    @items << Item.new
  end
end
