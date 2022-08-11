require './book'
require './label'
require './data/data_book'

class Bookapp
  def initialize
    @all_books = []
    @all_labels = []
  end

  def list_all_books
    puts 'There are no books to show! Please add a book.' if @all_books.empty?

    @all_books.each do |book|
      puts "ID: #{book.id}, Publisher: #{book.publisher}, Cover State: #{book.cover_state},
      Label: #{book.label.title} #{book.label.color},
      Publish Date: #{book.publish_date}, Archived: #{book.archived}"
    end
    puts
    puts
  end

  def list_all_labels
    puts 'There are no labels to show! Please add a label.' if @all_labels.empty?

    @all_labels.each { |label| puts "Title: \'#{label.title}\', Color: \'#{label.color}\'" }
    puts
    puts
  end

  def add_book
    print 'Publisher: '
    book_publisher = gets.chomp

    print 'Cover State: '
    book_cover_state = gets.chomp

    print 'Label Title: '
    book_label_title = gets.chomp

    print 'Label Color: '
    book_label_color = gets.chomp

    print 'Publish Date: '
    book_publish_date = gets.chomp

    label = Label.new book_label_title, book_label_color

    mybook = Book.new book_publisher, book_cover_state, book_publish_date

    @all_books << mybook
    @all_labels << label

    label.add_item(mybook)

    save_book(book_publisher, book_cover_state, book_label_title, book_label_color, book_publish_date)
  end

  def load_preserve_data
    load_books_and_labels @all_books, @all_labels
  end
end
