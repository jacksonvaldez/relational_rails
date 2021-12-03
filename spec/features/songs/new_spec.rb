require 'rails_helper'

RSpec.describe 'Create Artist Form' do

  before(:each) do
    @doja = Artist.create!(name: 'Doja Cat', alive: true, monthly_listeners: 400)
    visit "/artists/#{@doja.id}/songs/new"
    fill_in('song[name]', with: 'Say So')
    fill_in('song[length_s]', with: '120')

    click_button()
  end

  it 'takes you to correct path' do
    expect(page).to have_current_path("/artists/#{@doja.id}/songs")
  end

  it 'lists a new song' do
    expect(page).to have_content('Say So')
  end

  it 'saves length_s attribute' do
    expect(page).to have_content('120')
  end
  
end
