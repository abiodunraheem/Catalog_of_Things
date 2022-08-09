class Author
  attr_accessor :id, :first_name, :last_name, :items

  def initialize(first_name, last_name)
    @id = rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_items(game)
    @items.push(game)
    game.add_author(self)
  end
end
