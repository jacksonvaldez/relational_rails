require 'rails_helper'

RSpec.describe Artist do
  it {should have_many :songs}
  
  before(:each) do
    @artist = Artist.create!({ name: 'Prince', alive: false, monthly_listeners: 50_000 })
    @song_1 = Song.create!(name: 'Purple Rain', top_100: false, length_s: 100, artist_id: @artist.id)
    @song_2 = Song.create!(name: 'Dove Cry', top_100: true, length_s: 150, artist_id: @artist.id)
  end
  it 'attributes' do
    expect(@artist.name).to eq('Prince')
    expect(@artist.alive).to eq(false)
    expect(@artist.monthly_listeners).to eq(50000)
    expect(@artist.created_at).to be_a(ActiveSupport::TimeWithZone)
    expect(@artist.updated_at).to be_a(ActiveSupport::TimeWithZone)
    # expect(artist.created_at).to be_an(50000)
  end

  describe '#songs' do
    it 'returns a collection of songs' do
      # binding.pry
      expect(@artist.songs).to eq([@song_1, @song_2])
    end
  end

  describe '#song_count' do
    it 'returns the count of songs that the artist has' do
      expect(@artist.song_count).to eq(2)
    end
  end
end
