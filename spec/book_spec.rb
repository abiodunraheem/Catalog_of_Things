require './book'
require 'date'

describe Book do
  before :each do
    @book_one = Book.new 'Pedro', 'bad', Date.parse('12-07-2000')
    @book_two = Book.new 'Gabrielle', 'good', Date.parse('12-07-1995')
    @book_three = Book.new 'Dudu', 'good', Date.parse('12-07-2019')
    @book_four = Book.new 'Publisher', 'bad', Date.parse('12-07-2002')
  end

  it 'The can_be_achived? method returns true if difference between current date
    and publish date is greater than 10 and cover_state equals to "bad"' do
    @book_one.move_to_archive
    expect(@book_one.archived).to be true
  end

  it 'The can_be_achived? method returns true if difference between current
    date and publish date is greater than 10 and cover_state equals to "good"' do
    @book_two.move_to_archive
    expect(@book_two.archived).to be true
  end

  it 'The can_be_achived? method returns false if difference between current
    date and publish date is less than 10 and cover_state equals to "good"' do
    @book_three.move_to_archive
    expect(@book_three.archived).to be false
  end

  it 'The can_be_achived? method returns false if difference between current
    date and publish date is less than 10 and cover_state equals to "bad"' do
    @book_four.move_to_archive
    expect(@book_four.archived).to be true
  end
end
