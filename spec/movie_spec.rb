require_relative '../movie'

describe Movie do
  before :each do
    @movie = Movie.new('2012-02-15', false)
  end

  context 'When Testing the movie class' do
    it 'Should create an instance of the movie class' do
      expect(@movie).to be_an_instance_of Movie
    end

    it 'Should archive the movie' do
      expect(@movie.can_be_archived?).to be_truthy
    end
  end
end
