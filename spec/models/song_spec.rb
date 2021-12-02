require 'rails_helper'

RSpec.describe Song do
  before(:each) do
    @artist = Artist.create!(name: "Doja Cat", alive: true, monthly_listeners: 100000)
    @song = Song.create!(name: 'Say So', top_100: true, length_s: 209, artist_id: @artist.id)
  end

  it 'attributes' do
    expect(@song.name).to eq('Say So')
    expect(@song.top_100).to eq(true)
    expect(@song.length_s).to eq(209)
    expect(@song.created_at).to be_a(ActiveSupport::TimeWithZone)
    expect(@song.updated_at).to be_a(ActiveSupport::TimeWithZone)
    # expect(artist.created_at).to be_an(50000)
  end

  describe '#artist' do
    it 'returns the artist the song belongs to' do
      expect(@song.artist).to eq(@artist)
    end
  end
end
