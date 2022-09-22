require_relative '../book'

describe Book do
  before :each do
    @book = Book.new('Macmillan', 'bad', '2010/02/02')
  end

  context 'When Testing the Book class' do
    it 'Should create an instance of the book class' do
      expect(@book).to be_an_instance_of Book
    end

    it 'Should archive the book' do
      expect(@book.can_be_archived?).to be_truthy
    end
  end
end
