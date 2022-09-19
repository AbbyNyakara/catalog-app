require 'securerandom'

class Item
  attr_accessor :genre, :author, :source, :label
  attr_reader :books

  def initialize(publish_date, id: SecureRandom.hex(5), archived: false)
    @id = id
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = archived
    @books = []
  end

  def move_to_archive
    if can_be_archived?
      @archived = true
    end
  end

  def add_book(book)
    @books << book
  end

  private

  def can_be_archived?
    @publish_date > 10 ? true : false
  end
end
