require './item'
require 'securerandom'

class Book < Item
  attr_reader :cover_state, :publisher, :archived

  def initialize(publisher, cover_state, publish_date, id: SecureRandom.hex(5))
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
    @id = id
  end

  def mimi
    can_be_archived?
  end

  private

  def can_be_archived?
    if @cover_state == 'bad' || super
      return true
    else
      return false
    end
  end
end



