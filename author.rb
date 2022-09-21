require 'securerandom'
require './item'

class Author
  attr_accessor :first_name, :last_name, :items, :id

  def initialize(first_name, last_name)
    @id = SecureRandom.hex(5)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.author = self
  end
end
