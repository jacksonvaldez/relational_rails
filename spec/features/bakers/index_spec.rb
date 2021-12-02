require 'rails_helper'

RSpec.describe 'list of all bakers' do
  it 'list baker names' do
    bakery_1 = Bakery.create!(name: "Dunkin Donuts", is_open: true, customer_capacity: 100000)
    baker_1 = Baker.create!(name: "John Smith", is_working: true, salary: 300)
    baker_2 = Baker.create!(name: "Jane Smith", is_working: false, salary: 250)

    visit '/bakers'

    expect(page).to have_content('John Smith')
    expect(page).to have_content('Jane Smith')
  end
end
