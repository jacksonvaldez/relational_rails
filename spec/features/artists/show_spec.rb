require 'rails_helper'

RSpec.describe 'list of all artists' do
  before(:each) do
    @artist_1 = Artist.create!(name: "Kanye West", alive: true, monthly_listeners: 100000)
    @artist_2 = Artist.create!(name: "Ice Cube", alive: true, monthly_listeners: 30000)
    @song_1 = Song.create!(name: "Flashing Lights", top_100: true, length_s: 300, artist_id: @artist_1.id)
    @song_2 = Song.create!(name: "It Was a Good Day", top_100: false, length_s: 30, artist_id: @artist_2.id)


    visit "/artists/#{@artist_1.id}"
  end
  it 'list artist names' do

    expect(page).to have_content('Kanye West')
    expect(page).to have_content('true')
    expect(page).to have_content('100000')
    expect(page).to have_content('0')
    expect(page).to_not have_content('Ice Cube')
  end

  it 'redirects to correct path' do
    expect(page).to have_current_path("/artists/#{@artist_1.id}")
  end

  it 'redirects to correct path after deleting' do
    click_on 'Delete'
    expect(page).to have_current_path("/artists")
  end

  it 'deletes an artist' do
    click_on 'Delete'
    expect(page).to have_content("Ice Cube")
    expect(page).to_not have_content("Kanye West")
  end

  it 'deletes songs associated with respective artist' do
    click_on 'Delete'
    visit '/songs/'
    expect(page).to_not have_content("Flashing Lights")

  end
end
