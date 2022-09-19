require 'securerandom'

class Item
  attr_accessor :genre, :author, :source, :label, :publish_date
  def initialize(id: SecureRandom.hex(5), genre, author, source, label, publish_date, archived: false)

    @id = id
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = archived
  end

  def move_to_archive
    if can_be_archived?
      self.archived = true
    end
  end

  private

  def can_be_archived?
    self.publish_date > 10 ? true : false
  end


end