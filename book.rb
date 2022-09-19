require './item'
require 'securerandom'

class Book
  attr_reader :cover_state

  def initialize(publisher, cover_state, id: SecureRandom.hex(5))
    super()
    @publisher = publisher
    @cover_state = cover_state
    @id = id
  end

  private

  def can_be_archived?
    if cover_state == 'bad'
      self.archived = true
    end
  end
end

second = Item.new(15)
first = Book.new('Moran', 'bad')
second.add_book(first)

p second.books
p second.move_to_archive
