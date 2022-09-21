require 'date'
require './item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(publish_date, multiplayer, last_played_at)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  private

  def can_be_archived?
    return true if super() && Date.strptime(@last_played_at, '%Y-%m-%d') < DateTime.now.prev_year(2)

    false
  end
end
