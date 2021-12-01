require 'rails_helper'

RSpec.describe 'Visiting artist index', type: :feature do
  scenario 'clicking around' do
    artist = Artist.create!(name: "Sia", alive: true, monthly_listeners: 500000)
    visit('/') # visit root
    click_on 'Artists'
    # fill_in 'Name', with: 'Minneapolis'
    # click_on 'Create City'
    # visit cities_path
    # expect(page).to have_content('Minneapolis')
    expect(page).to have_content("Sia")
  end
end
