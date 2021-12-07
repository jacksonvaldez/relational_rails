require 'rails_helper'

RSpec.describe 'Create Baker Form' do

  before(:each) do
    @dunkin = Bakery.create!(name: 'Dunkin Donuts', is_open: true, customer_capacity: 400)
    visit "/bakeries/#{@dunkin.id}/bakers/new"
    fill_in(:name, with: 'Jon Doe')
    fill_in(:salary, with: '12000')
    select('No', from: :is_working)

    click_button 'Hire Baker'
  end

  it 'takes you to correct path' do
    expect(page).to have_current_path("/bakeries/#{@dunkin.id}/bakers")
  end

  it 'lists a new baker' do
    expect(page).to have_content('Jon Doe')
  end

  it 'saves salary attribute' do
    expect(page).to have_content('12000')
  end

  it 'saves is_working attribute' do
    expect(page).to have_content('false')
  end

end
