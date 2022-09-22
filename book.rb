require './item'

class Book < Item
  attr_accessor :cover_state, :publisher, :archived

  def initialize(publisher, cover_state, publish_date)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def to_json(*_args)
    "{
      \"publisher\": \"#{publisher}\",
      \"cover_state\": \"#{cover_state}\",
      \"publish_date\": \"#{publish_date}\"
    }"
  end

  # private

  def can_be_archived?
    if @cover_state == 'bad' || super
      true
    else
      false
    end
  end
end
