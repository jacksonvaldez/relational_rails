require 'rails_helper'

RSpec.describe 'list of all bakers' do
  it 'list baker names' do
    bakery_1 = Bakery.create!(name: "Dunkin Donuts", is_open: true, customer_capacity: 100000)
    baker_1 = Baker.create!(name: "John Smith", is_working: true, salary: 300, bakery_id: bakery_1.id)
    baker_2 = Baker.create!(name: "Jane Smith", is_working: false, salary: 250, bakery_id: bakery_1.id)
    baker_3 = Baker.create!(name: "Russell Crowe", is_working: true, salary: 250, bakery_id: 10)

    visit "/bakers/#{baker_1.id}"

    expect(page).to have_content('John Smith')
    expect(page).to have_content('Dunkin Donuts')
    expect(page).to have_content('true')
    expect(page).to have_content('300')
    expect(page).to_not have_content("Russell Crowe")
  end
end