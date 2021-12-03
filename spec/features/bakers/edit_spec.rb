require 'rails_helper'

RSpec.describe 'Edit Baker Form' do

  before(:each) do
    @dunkin = Bakery.create!(name: "Dunkin Doughnuts", is_open: true, customer_capacity: 44)
    @bob = Baker.create!(name: "Bob Marley", is_working: false, salary: 12000, bakery_id: @dunkin.id)
    visit "/bakers/#{@bob.id}"
    click_on "Update This Baker"
    fill_in('baker[name]', with: 'Mob Barley')
    fill_in('baker[salary]', with: '13000')

    click_button()
  end

  it 'takes you to correct path' do
    expect(page).to have_current_path("/bakers/#{@bob.id}")
  end

  it 'lists a new baker' do
    expect(page).to have_content('Mob Barley')
  end

  it 'saves salary attribute' do
    expect(page).to have_content('13000')
  end

end
