require 'rails_helper'

RSpec.describe 'list of all bakers by bakery' do

  before(:each) do
    @bakery_1 = Bakery.create!(name: "Dunkin Donuts", is_open: true, customer_capacity: 100000)
    @bakery_2 = Bakery.create!(name: "Starbucks", is_open: true, customer_capacity: 150000)
    @baker_1 = Baker.create!(name: "John Smith", is_working: true, salary: 300, bakery_id: @bakery_1.id)
    @baker_2 = Baker.create!(name: "Jane Smith", is_working: false, salary: 250, bakery_id: @bakery_1.id)
    @baker_3 = Baker.create!(name: "Joe Dirt", is_working: true, salary: 230, bakery_id: @bakery_2.id)
    @baker_4 = Baker.create!(name: "Mike Jones", is_working: false, salary: 254, bakery_id: @bakery_2.id)

    visit "/bakeries/#{@bakery_2.id}/bakers"
  end

  it 'list baker names by bakery' do
    expect(page).to have_content('Joe Dirt')
    expect(page).to have_content('Starbucks')
    expect(page).to have_content('true')
    expect(page).to have_content('230')

    expect(page).to_not have_content('Jane Smith')
  end

end
