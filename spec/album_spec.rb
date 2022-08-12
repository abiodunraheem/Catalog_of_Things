require './basic/music_album'
require 'date'

describe MusicAlbum do
  it 'has a name' do
    date = Date.parse('28-03-1994')
    album = MusicAlbum.new(date, 'The Cure', 'y')
    expect(album.name).to eq('The Cure')
  end
  it 'returns the correct year' do
    date = Date.parse('28-03-1994')
    album = MusicAlbum.new(date, 'The Cure', 'y')
    expect(album.publish_date.year).to eq(1994)
  end
end
