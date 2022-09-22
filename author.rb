require 'securerandom'

class Author
  attr_accessor :first_name, :last_name, :items, :id

  def initialize(first_name, last_name)
    @id = SecureRandom.hex(5)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def to_json(*_args)
    "{
      \"id\": \"#{id}\",
      \"firts_name\": \"#{first_name}\",
      \"last_name\": \"#{last_name}\"
    }"
  end

  def add_item(item)
    @items.push(item)
    # item.author = self
  end
end
