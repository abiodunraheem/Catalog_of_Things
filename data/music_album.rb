require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :name
  attr_reader :publish_date

  def initialize(publish_date, name, on_spotify)
    super(publish_date)
    @on_spotify = on_spotify.downcase == 'y'
    @name = name
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
