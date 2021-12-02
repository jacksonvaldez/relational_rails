require 'rails_helper'

RSpec.describe 'list of all songs' do
  it 'list song names' do
    artist_1 = Artist.create!(name: "Kanye West", alive: true, monthly_listeners: 100000)
    song_1 = Song.create!(name: "Flashing Lights", top_100: true, length_s: 300, artist_id: artist_1.id)
    song_2 = Song.create!(name: "Gold Digger", top_100: false, length_s: 250, artist_id: artist_1.id)
    song_3 = Song.create!(name: "Roundabout", top_100: true, length_s: 250, artist_id: 10)

    visit "/songs/#{song_1.id}"

    expect(page).to have_content('Flashing Lights')
    expect(page).to have_content('Kanye West')
    expect(page).to have_content('true')
    expect(page).to have_content('300')
    expect(page).to_not have_content("Roundabout")
  end
end
