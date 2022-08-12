require 'json'
require './basic/genre'
require './basic/musicalbum'
require 'date'

def load_album_genre(myalbum, mygenre)
  if File.exist?('./data/albums.json')
    file = File.open('./data/albums.json')

    if file.size.zero?
      my_albums << []
      my_genres << []
    else
      albums = JSON.parse(File.read('./data/albums.json'))

      albums.each do |album|
        genre = Genre.new(album['genre'])
        album = MusicAlbum.new(Date.parse(album['published']), album['name'], album['spotify'])
        myalbum << album
        mygenre << genre

        genre.add_item(album)
      end
    end
    file.close
  else
    myalbum << []
    mygenre << []
  end
end

def save_album(date, name, genre, on_spotify)
  obj = {
    published: date,
    name: name,
    genre: genre,
    spotify: on_spotify
  }

  return unless File.exist?('./data/albums.json')

  file = File.open('./data/albums.json')

  if file.size.zero?
    album = [obj]
  else
    album = JSON.parse(File.read('./data/albums.json'))
    album << obj
  end

  file.close

  myfile = File.open('./data/albums.json', 'w')
  myfile.write(JSON.pretty_generate(album))
  myfile.close
end
