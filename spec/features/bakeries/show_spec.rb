require 'rails_helper'

RSpec.describe 'list of all artists' do
  it 'list artist names' do
    bakery_1 = Bakery.create!(name: "Tim Hortons", is_open: false, customer_capacity: 5)
    bakery_2 = Bakery.create!(name: "Starbucks", is_open: true, customer_capacity: 10)
    visit "/bakeries/#{bakery_1.id}"

    expect(page).to have_content('Tim Hortons')
    expect(page).to have_content('false')
    expect(page).to have_content('5')
    expect(page).to have_content('0')
    expect(page).to_not have_content('Starbucks')
  end
end
