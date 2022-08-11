# require_relative './book'
# require_relative './label'
# require_relative 'data/data_book'
# require_relative 'data/handle_data'
# require_relative './musicalbum'
# require_relative './genre'
# require_relative './music_controller'
# require_relative './game'
# require_relative './author'
# require_relative 'data/game_data'
# require 'date'

# # rubocop:disable Metrics

# class App
#   def initialize
#     @genres = []
#     @albums = []
#     @all_books = []
#     @all_labels = []
#     @games = []
#     @authors = []
#   end

#   def run
#     load_preserve_data
#     puts 'Welcome To The Catalog of My Things!'
#     puts
#     puts
#     until list_options
#       input = gets.chomp
#       if input == '10'
#         puts 'Thank you! :)'
#         break
#       end
#       option(input)
#     end
#   end

#   def list_books
#     puts
#     puts 'There are no books to show! Please add a book.' if @all_books.empty?

#     @all_books.each do |book|
#       puts '----------------'
#       puts "ID: #{book.id}"
#       puts "Publisher: #{book.publisher}"
#       puts "Cover State: #{book.cover_state}"
#       puts "Label: \'#{book.label.title}\', \'#{book.label.color}\'"
#       puts "Publish Date: #{book.publish_date}"
#       puts '----------------'
#       puts
#     end
#     puts
#     puts
#     sleep 0.75
#   end

#   def list_albums
#     puts
#     puts 'There are no albums to list. Select (8) to create one.' if @albums.empty?

#     @albums.each do |album|
#       puts "ID: #{album.id}: Name: #{album.name} Genre: #{album.genre.name} On_Spotify: #{album.on_spotify}"
#       puts
#     end
#   end

#   def list_labels
#     puts
#     puts 'There are no labels to show! Please add a label.' if @all_labels.empty?

#     @all_labels.each { |label| puts "Id: \'#{label.id}\', Title: \'#{label.title}\', Color: \'#{label.color}\'" }
#     puts
#     puts
#     sleep 0.75
#   end

#   def list_genres
#     puts
#     puts 'There are no genres! You can create one by adding a genre.' if @genres.empty?

#     @genres.each_with_index { |genre, index| puts "#{index}: Name: #{genre.name}" }
#     puts
#     puts
#   end

#   def create_book
#     puts
#     print 'Publisher: '
#     book_publisher = gets.chomp

#     print 'Cover State: '
#     book_cover_state = gets.chomp

#     print 'Label Title: '
#     book_label_title = gets.chomp

#     print 'Label Color: '
#     book_label_color = gets.chomp

#     print 'Publish Date (DD-MM-YYYY): '
#     book_publish_date = gets.chomp

#     puts

#     label = Label.new book_label_title, book_label_color

#     mybook = Book.new book_publisher, book_cover_state, book_publish_date

#     @all_books << mybook
#     @all_labels << label

#     label.add_item(mybook)

#     save_book(book_publisher, book_cover_state, book_label_title, book_label_color, book_publish_date)

#     puts 'Book created successfully.✅'
#     puts
#     puts
#     sleep 0.75
#   end

#   def create_album
#     puts 'Name: '
#     name = gets.chomp

#     puts 'Publish Date (DD-MM-YYYY): '
#     date = Date.parse(gets.chomp)

#     puts 'Genre: '
#     genre_name = gets.chomp

#     puts 'On Spotify (y/n): '
#     on_spotify = gets.chomp

#     album = MusicAlbum.new(date, name, on_spotify)
#     genre = Genre.new(genre_name)

#     @albums << album
#     @genres << genre

#     genre.add_item(album)

#     save_album(date, name, genre_name, on_spotify)

#     puts "#{name} has been added to the list. ✅"
#   end

#   def create_game
#     print 'Is this game multiplayer no(n) or yes(y) -> (Y/N):'
#     multiplayer = gets.chomp.downcase == 'y' ? 'yes' : 'no'
#     print 'Please enter published date, format -> YYYY-MM-DD:'
#     publish_date = gets.chomp
#     print 'Please enter date last played, format -> YYYY-MM-DD:'
#     last_played = gets.chomp
#     print 'Please enter the first name:'
#     author_first = gets.chomp
#     print 'Please enter the last name:'
#     author_last = gets.chomp
#     new_author = Author.new(author_first, author_last)
#     game = Game.new(multiplayer, last_played, publish_date)
#     @games << game
#     @authors << new_author
#     new_author.add_items(game)
#     save_game(game)
#     puts 'The Game has been created successfully ✅'
#   end

#   def list_games
#     if @games.empty?
#       puts 'The Games Catalog is empty! Please choose (12) to add a game.'
#     else
#       @games.each do |game|
#         puts "Multiplayer: #{game.multiplayer}"
#         puts "last played at: #{game.last_played_at}"
#         puts "published date: #{game.publish_date}"
#         puts "author_firstname => #{game.author.first_name}"
#         puts "author_lastname => #{game.author.last_name}\n"
#         puts
#       end
#     end
#   end

#   def list_authors
#     if @authors.empty?
#       puts 'The Catalog is empty! Please choose (13) to add an author.'
#     else
#       @authors.each do |author|
#         puts "ID: #{author.id}", "First name: #{author.first_name}, Last name: #{author.last_name}"
#       end
#     end
#   end

#   def load_preserve_data
#     load_album_genre @albums, @genres
#     load_books_and_labels @all_books, @all_labels
#     load_manager @games, @authors
#   end
# end

# # rubocop:enable Metrics

require_relative './game/game_controller'
require_relative './musicAlbum/music_controller'
require './book/book_controller'
require './movie/movie_controller'

class App
  attr_accessor :music_controller, :game_controller
  attr_reader :label_controller

  def initialize
    @book_controller = BookController.new
    @movie_controller = MovieController.new
    @game_controller = GameController.new
    @music_controller = MusicController.new
  end

  def books
    puts "
       1. List all books
       2. List all labels
       3. Add new book
    "
    choice = gets.chomp
    case choice
    when '1'
      @book_controller.books_list
    when '2'
      @book_controller.labels_list
    when '3'
      @book_controller.add_book
    else
      puts 'Invalid choice'
      books
    end
  end

  def music
    print 'Hello! What tasks would you like to perform?:
    1. List all music albums
    2. List all genres
    3. Add a music album
    : '
    choice = gets.chomp.to_i

    case choice
    when 1
      @music_controller.list_all_music
    when 2
      @music_controller.list_all_genres
    when 3
      @music_controller.add_music
    else
      puts 'That was an invalid choice. Try again'
      music
    end
  end

  def games
    puts "
    1. List all games
    2. List all authors
    3. Add new game
    "
    choice = gets.chomp
    case choice
    when '1'
      @game_controller.list_games
    when '2'
      @game_controller.list_authors
    when '3'
      @game_controller.add_game
    else
      puts 'Invalid choice'
      games
    end
  end

  def movies
    puts "
      1. List all movies
      2. List all sources
      3. Add a movie
    "
    choice = gets.chomp
    case choice
    when '1'
      @movie_controller.movies_list
    when '2'
      @movie_controller.sources_list
    when '3'
      @movie_controller.add_movie
    else
      puts 'Invalid choice'
      books
    end
  end
end
