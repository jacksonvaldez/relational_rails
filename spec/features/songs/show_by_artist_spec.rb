require 'rails_helper'

RSpec.describe 'list of all songs by artist' do

  before(:each) do
    @artist_1 = Artist.create!(name: "Kanye West", alive: true, monthly_listeners: 100000)
    @artist_2 = Artist.create!(name: "Ariana Grande", alive: true, monthly_listeners: 150000)
    @song_1 = Song.create!(name: "Flashing Lights", top_100: true, length_s: 300, artist_id: @artist_1.id)
    @song_2 = Song.create!(name: "Gold Digger", top_100: false, length_s: 250, artist_id: @artist_1.id)
    @song_3 = Song.create!(name: "Seven Rings", top_100: true, length_s: 230, artist_id: @artist_2.id)
    @song_4 = Song.create!(name: "Side to Side", top_100: false, length_s: 254, artist_id: @artist_2.id)

    visit "/artists/#{@artist_2.id}/songs"
  end

  it 'list song names by artist' do
    expect(page).to have_content('Seven Rings')
    expect(page).to have_content('Ariana Grande')
    expect(page).to have_content('true')
    expect(page).to have_content('230')

    expect(page).to_not have_content('Gold Digger')
  end
  it 'has correct path' do
    click_on 'Sort Songs'

    expect(page).to have_current_path("/artists/#{@artist_2.id}/songs")
  end
end
