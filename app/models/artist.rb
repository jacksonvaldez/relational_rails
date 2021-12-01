class Artist < ApplicationRecord

  def songs
    Song.where(artist_id: self.id)
  end

  def song_count
    self.songs.count
  end

end
