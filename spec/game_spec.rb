require_relative '../game'

describe Game do
  before :each do
    @game = Game.new('2001-02-02', 'multiplayer', '2012-02-14')
  end

  context 'When testing the Game class' do
    it 'Should Create an instance of the Game class' do
      expect(@game).to be_an_instance_of Game
    end

    it 'Should archive the game' do
      expect(@game.can_be_archived?).to be_truthy
    end
  end
end
