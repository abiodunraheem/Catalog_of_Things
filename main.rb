require './app'

# rubocop:disable Metrics

def main
  app = App.new
  app.run
end

def list_options
  puts 'Please choose an option by entering a number'
  puts '1 - List all books'
  puts '2 - List all labels'
  puts '3 - List all musics'
  puts '4 - List all genres'
  puts '5 - List all games'
  puts '6 - List all authors'
  puts '7 - Create a book'
  puts '8 - Create an album'
  puts '9 - Create a game'
  puts '10 - Exit'
end

def option(input)
  case input
  when '1'
    list_books
  when '2'
    list_labels
  when '3'
    list_albums
  when '4'
    list_genres
  when '5'
    list_games
  when '6'
    list_authors
  when '7'
    create_book
  when '8'
    create_album
  when '9'
    create_game
  else
    puts 'Please choose the correct option...'
  end
end

main

# rubocop:enable Metrics
