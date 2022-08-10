require_relative './book'
require_relative './label'
require_relative 'data/data_book'
require_relative 'data/data_album'
require_relative './musicalbum'
require_relative './genre'
require_relative './game'
require_relative './author'
require_relative 'data/game_data'
require 'date'

class App
  def initialize
    @genres = []
    @albums = []
    @all_books = []
    @all_labels = []
    @games = []
    @authors = []
  end

  def run
    load_preserve_data
    puts 'Welcome To The Catalog of My Things!'
    puts
    puts
    until list_options
      input = gets.chomp
      if input == '10'
        puts 'Thank you! :)'
        break
      end
      option(input)
    end
  end

  def list_books
    puts
    puts 'There are no books to show! Please add a book.' if @all_books.empty?

    @all_books.each do |book|
      puts '----------------'
      puts "ID: #{book.id}"
      puts "Publisher: #{book.publisher}"
      puts "Cover State: #{book.cover_state}"
      puts "Label: \'#{book.label.title}\', \'#{book.label.color}\'"
      puts "Publish Date: #{book.publish_date}"
      puts '----------------'
      puts
    end
    puts
    puts
    sleep 0.75
  end

  def create_game
    print 'Is this game multiplayer no(n) or yes(y) -> (Y/N):'
    multiplayer = gets.chomp.downcase == 'y' ? 'yes' : 'no'
    print 'Please enter published date, format -> YYYY-MM-DD:'
    publish_date = gets.chomp
    print 'Please enter date last played, format -> YYYY-MM-DD:'
    last_played = gets.chomp
    print 'Please enter the first name:'
    author_first = gets.chomp
    print 'Please enter the last name:'
    author_last = gets.chomp
    new_author = Author.new(author_first, author_last)
    game = Game.new(multiplayer, last_played, publish_date)
    @games << game
    @authors << new_author
    new_author.add_items(game)
    save_game(game)
    puts 'The Game has been created successfully ✅'
  end

  def list_games
    if @games.empty?
      puts 'The Games Catalog is empty! Please choose (12) to add a game.'
    else
      @games.each do |game|
        puts "Multiplayer: #{game.multiplayer}"
        puts "last played at: #{game.last_played_at}"
        puts "published date: #{game.publish_date}"
        puts "author_firstname => #{game.author.first_name}"
        puts "author_lastname => #{game.author.last_name}\n"
        puts
      end
    end
  end

  def list_authors
    if @authors.empty?
      puts 'The Catalog is empty! Please choose (13) to add an author.'
    else
      @authors.each do |author|
        puts "ID: #{author.id}", "First name: #{author.first_name}, Last name: #{author.last_name}"
      end
    end
  end

  def load_preserve_data
    load_manager @games, @authors
  end
end
