require 'rails_helper'

RSpec.describe 'Edit Artist Form' do

  before(:each) do
    @ariana = Artist.create!(name: "Ariana Grande", alive: true, monthly_listeners: 150000)
    visit "/artists/#{@ariana.id}"
    click_on "Update Artist"
    fill_in('artist[name]', with: 'Ariana Grandeeee')
    fill_in('artist[monthly_listeners]', with: '88888')

    click_button()
  end

  it 'takes you to correct path' do
    expect(page).to have_current_path("/artists/#{@ariana.id}")
  end

  it 'lists a new artist' do
    expect(page).to have_content('Ariana Grandeeee')
  end

  it 'saves monthly_listeners attribute' do
    expect(page).to have_content('88888')
  end

end
