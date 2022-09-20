require 'securerandom';
require './item';

class Genre < Item
  attr_accesor :id, :name, :items
  
  def initialize(id: SecureRandom.hex(5), name, items: [])
    @id = id
    @name = name
    @items = items
  end

  def add_items
    @items << Item.new()
  end
end