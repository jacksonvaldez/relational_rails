require 'rails_helper'

RSpec.describe 'list of all bakers by bakery' do

  before(:each) do
    @bakery_1 = Bakery.create!(name: "Dunkin Donuts", is_open: true, customer_capacity: 100000)
    @bakery_2 = Bakery.create!(name: "Starbucks", is_open: true, customer_capacity: 150000)
    @baker_1 = Baker.create!(name: "John Smith", is_working: true, salary: 300, bakery_id: @bakery_1.id)
    @baker_2 = Baker.create!(name: "Jane Smith", is_working: false, salary: 250, bakery_id: @bakery_1.id)
    @baker_3 = Baker.create!(name: "Mike Jones", is_working: true, salary: 15000, bakery_id: @bakery_2.id)
    @baker_4 = Baker.create!(name: "Joe Dirt", is_working: false, salary: 20000, bakery_id: @bakery_2.id)

    visit "/bakeries/#{@bakery_2.id}/bakers"
  end

  it 'list baker names by bakery' do
    expect(page).to have_content('Joe Dirt')
    expect(page).to have_content('Starbucks')
    expect(page).to have_content('true')
    expect(page).to have_content('20000')

    expect(page).to_not have_content('Jane Smith')
  end

  it 'sorts the baker names alphabetically when asked' do
    click_on 'Sort Bakers'
    expect(page).to have_content("Salary: $20000/yr\nMike Jones")
  end

  it 'returns bakers with salary greater than threshold' do
    fill_in('baker[salary_threshold]', with: '17000')
    click_button('Submit')

    expect(page).to have_content("Joe Dirt")
    expect(page).to_not have_content("Mike Jones")
  end

  it 'returns bakers with salary greater than a threshold that is blank' do

    click_button('Submit')

    expect(page).to have_content("Joe Dirt")
    expect(page).to have_content("Mike Jones")
  end
end
