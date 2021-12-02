require 'rails_helper'

RSpec.describe 'list of all artists' do
  it 'list artist names' do
    artist_1 = Artist.create!(name: "Kanye West", alive: true, monthly_listeners: 100000)
    artist_2 = Artist.create!(name: "Ice Cube", alive: true, monthly_listeners: 30000)
    visit "/artists/#{artist_1.id}"

    expect(page).to have_content('Kanye West')
    expect(page).to have_content('true')
    expect(page).to have_content('100000')
    expect(page).to have_content('0')
    expect(page).to_not have_content('Ice Cube')
  end
end
