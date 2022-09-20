require 'securerandom'
require 'date'

class Item
  attr_accessor :genre, :author, :source, :label, :publish_date, :archived

  def initialize(publish_date, id: SecureRandom.hex(5), archived: false)
    @id = id
    @publish_date = publish_date
    @archived = archived
  end

  def move_to_archive
    if can_be_archived?
      self.archived = true
    else
      self.archived = false
    end
  end

  def author=(author)
    @author = author
    author.items << self
  end

  def genre=(genre)
    @genre = genre
    genre.items << self
  end

  def source=(source)
    @source = source
    source.items << self
  end

  def label=(label)
    @label.items << self
  end

  private

  def can_be_archived?
    return Date.strptime(@publish_date, '%Y-%m-%d') < DateTime.now.prev_year(10)
  end
end
