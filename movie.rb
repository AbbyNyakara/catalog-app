require './item'

class Movie < Item
  attr_accessor :silent

  def initialize(publish_date)
    super(publish_date)
    @silent
  end

  def can_be_archived?
    parent = super()
    if parent || @silent
      return true
    end
    false
  end
end
