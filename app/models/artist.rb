class Artist < ApplicationRecord
  has_many :songs, dependent: :destroy

  def song_count
    self.songs.count
  end

end
