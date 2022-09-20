require './item'

class Movie < Item
  attr_accessor :silent

  def initialize(publish_date, silent)
    super(publish_date)
    @silent = silent
  end

  def can_be_archived?
    parent = super()
    return true if parent || silent

    false
  end

  private :can_be_archived?
end
