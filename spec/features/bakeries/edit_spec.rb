require 'rails_helper'

RSpec.describe 'Edit Bakery Form' do

  before(:each) do
    @dunkin = Bakery.create!(name: "Dunkin Doughnuts", is_open: true, customer_capacity: 44)
    visit "/bakeries/#{@dunkin.id}"
    click_on "Update This Bakery"
    fill_in('bakery[name]', with: 'Dunkin Donuts')
    fill_in('bakery[customer_capacity]', with: '67')

    click_button()
  end

  it 'takes you to correct path' do
    expect(page).to have_current_path("/bakeries/#{@dunkin.id}")
  end

  it 'lists a new bakery' do
    expect(page).to have_content('Dunkin Donuts')
  end

  it 'saves customer_capacity attribute' do
    expect(page).to have_content('67')
  end

end
