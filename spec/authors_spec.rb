require '.basic/author'
require '.basic/game'

describe Author do
  before :all do
    @game = Game.new('Pedro', '2019-01-01', '2014-12-14')
    @author = Author.new('Dudu', 'Kaka')
  end
  context 'When creating @author, an instance of class Author' do
    it 'takes two parameters and return a Label object' do
      expect(@author).to be_instance_of Author
    end
  end
  context 'When retrieving the first name of an author' do
    it 'returns the correct first name' do
      expected_value = 'Dudu'
      expect(@author.first_name).to eq(expected_value)
    end
  end
  context 'When adding a game into an author' do
    it 'adds the game into a specific author' do
      @author.add_items(@game)
      expect(@author.items).to include(@game)
      expect(@author.items.length).to eq(1)
    end
  end
end
