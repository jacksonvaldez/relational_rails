require 'rails_helper'

RSpec.describe 'list of all bakers' do
  before(:each) do
    @bakery_1 = Bakery.create!(name: "Dunkin Donuts", is_open: true, customer_capacity: 100000)
    @baker_1 = Baker.create!(name: "John Smith", is_working: true, salary: 300, bakery_id: @bakery_1.id)
    @baker_2 = Baker.create!(name: "Jane Smith", is_working: false, salary: 250, bakery_id: @bakery_1.id)

    visit "/bakers/#{@baker_1.id}"
  end
  it 'list baker names' do
    expect(page).to have_content('John Smith')
    expect(page).to have_content('Dunkin Donuts')
    expect(page).to have_content('true')
    expect(page).to have_content('300')
  end

  it 'redirects to correct path' do
    expect(page).to have_current_path("/bakers/#{@baker_1.id}")
  end

  it 'redirects to correct path after deleting' do
    click_on 'Delete'
    expect(page).to have_current_path("/bakers")
  end

  it 'deletes a baker' do
    click_on 'Delete'
    expect(page).to have_content("Jane Smith")
    expect(page).to_not have_content("John Smith")
  end
end
