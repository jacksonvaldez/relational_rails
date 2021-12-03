# require 'rails_helper'
#
#
# RSpec.describe 'Edit Artist Form' do
#   it 'has a submit button' do
#     artist_1 = Artist.create!(name: 'Prince', alive: false, monthly_listeners: 50000)
#     visit "/artists/#{artist_1.id}/edit"
#
#     expect(page).to have_button('Submit')
#   end
#   it 'fills in' do
#     artist_1 = Artist.create!(name: 'Prince', alive: false, monthly_listeners: 50000)
#     visit "/artists/#{artist_1.id}/edit"
#     fill_in('artist[name]', with: 'John')
#     save_and_open_page
#   end
# end
