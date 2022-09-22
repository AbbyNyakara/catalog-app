require_relative '../author'

describe Author do
  before :each do
    @author = Author.new('Abby', 'Nyakara')
  end

  context 'When Testing the Author Class' do
    it 'Should create an instance of the Author Class' do
      expect(@author).to be_an_instance_of Author
    end

    it 'Should add an item to the items array' do
      @author.add_item('Author 1')
      expect(@author.items).not_to be_empty
    end

    it 'Should return first name, last name and the date' do
      expect(@author.first_name).to eq 'Abby'
      expect(@author.last_name).to eq 'Nyakara'
    end
  end
end
