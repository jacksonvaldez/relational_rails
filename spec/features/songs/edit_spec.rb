require 'rails_helper'

RSpec.describe 'Edit Song Form' do

  before(:each) do
    @ariana = Artist.create!(name: "Ariana Grande", alive: true, monthly_listeners: 5000000)
    @thankunext = Song.create!(name: "thank u, next", top_100: true, length_s: 123, artist_id: @ariana.id)
    visit "/songs/#{@thankunext.id}"
    click_on "Update This Song"
    fill_in('song[name]', with: 'thank you, next')
    fill_in('song[length_s]', with: '125')

    click_button()
  end

  it 'takes you to correct path' do
    expect(page).to have_current_path("/songs/#{@thankunext.id}")
  end

  it 'lists a new song' do
    expect(page).to have_content('thank you, next')
  end

  it 'saves length_s attribute' do
    expect(page).to have_content('125')
  end

end
