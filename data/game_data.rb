require 'json'
require '../basic/game'
require '../basic/author'

def load_manager(gamestore, authorstore) # rubocop:todo Metrics/MethodLength
  storage = './data/games.json'
  if File.exist?(storage)
    file = File.open(storage)

    if file.size.zero?
      gamestore << []
      authorstore << []
    else
      allstored = JSON.parse(File.read(storage))

      allstored.each do |stored|
        game = Game.new(stored['multiplayer'], stored['last_played_at'], stored['publish_date'])
        author = Author.new(stored['author_firstname'], stored['author_lastname'])
        gamestore << game
        authorstore << author
        author.add_items(game)
      end
    end
    file.close
  else
    gamestore << []
    authorstore << []
  end
end

def save_game(game)
  File.new('./data/games.json', 'w+') unless File.exist?('./data/games.json')

  if File.empty?('./data/games.json')
    games = []
  else
    data = File.read('./data/games.json').split
    games = JSON.parse(data.join)
  end

  games.push({ 'multiplayer' => game.multiplayer, 'last_played_at' => game.last_played_at,
               'publish_date' => game.publish_date, 'author_firstname' => game.author.first_name,
               'author_lastname' => game.author.last_name })
  File.write('./data/games.json', JSON.generate(games))
end
