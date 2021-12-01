class Song < ApplicationRecord

  def artist
    Artist.find(self.artist_id)
  end

end
