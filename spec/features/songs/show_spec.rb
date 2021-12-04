require 'rails_helper'

RSpec.describe 'list of all songs' do
  before(:each) do
    @artist_1 = Artist.create!(name: "Kanye West", alive: true, monthly_listeners: 100000)
    @song_1 = Song.create!(name: "Flashing Lights", top_100: true, length_s: 300, artist_id: @artist_1.id)
    @song_2 = Song.create!(name: "Gold Digger", top_100: false, length_s: 250, artist_id: @artist_1.id)
    visit "/songs/#{@song_1.id}"
  end

  it 'list song names' do
    expect(page).to have_content('Flashing Lights')
    expect(page).to have_content('Kanye West')
    expect(page).to have_content('true')
    expect(page).to have_content('300')
  end

  it 'redirects to correct path' do
    expect(page).to have_current_path("/songs/#{@song_1.id}")
  end

  it 'redirects to correct path after deleting' do
    click_on 'Delete'
    expect(page).to have_current_path("/songs")
  end

  it 'deletes a song' do
    click_on 'Delete'
    expect(page).to have_content("Gold Digger")
    expect(page).to_not have_content("Flashing Lights")
  end
end
