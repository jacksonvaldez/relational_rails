class Artist < ApplicationRecord

def songs
  # binding.pry
  Song.all.to_a.find_all do |song|
    song.artist_id == self.id
  end
end

end
