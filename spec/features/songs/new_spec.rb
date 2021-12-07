require 'rails_helper'

RSpec.describe 'Create Song Form' do

  before(:each) do
    @doja = Artist.create!(name: 'Doja Cat', alive: true, monthly_listeners: 400)
    visit "/artists/#{@doja.id}/songs/new"
    fill_in(:name, with: 'Say So')
    fill_in(:length_s, with: '120')
    select('No', from: :top_100)

    click_button 'Add Song'
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

  it 'saves top_100 attribute' do
    expect(page).to have_content('Top 100: false')
  end

end
