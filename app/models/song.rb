class Song < ApplicationRecord

  def artist
    artist = Artist.find(self.artist_id)
    artist.name
  end

end
