require 'rails_helper'

RSpec.describe 'list of all songs' do
  it 'list song names' do
    artist_1 = Artist.create!(name: "Kanye West", alive: true, monthly_listeners: 100000)
    song_1 = Song.create!(name: "Flashing Lights", top_100: true, length_s: 300)
    song_2 = Song.create!(name: "Gold Digger", top_100: false, length_s: 250)

    visit '/songs'

    expect(page).to have_content('Flashing Lights')
    expect(page).to have_content('Gold Digger')
  end
end
