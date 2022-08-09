require '.game'
require 'date'

describe Game do
  before :each do
    @game = Game.new('Pedro', Date.parse('01-01-2018'), Date.parse('14-12-2018'))
  end
  context 'When creating @game, an instance of class Game ' do
    it 'takes four parameters and return a Game object' do
      expect(@game).to be_instance_of Game
    end
  end

  context 'When archiving a game' do
    it 'archives the game' do
      expect(@game.can_be_archived?).to eq(false)
    end
  end
end
