require 'rails_helper'

RSpec.describe 'list of all artists' do
  before(:each) do
    @bakery_1 = Bakery.create!(name: "Tim Hortons", is_open: false, customer_capacity: 5)
    @bakery_2 = Bakery.create!(name: "Starbucks", is_open: true, customer_capacity: 10)
    @baker_1 = Baker.create!(name: "Joe Shmoe", is_working: true, salary: 30000, bakery_id: @bakery_1.id)
    @baker_2 = Baker.create!(name: "Jane Smith", is_working: false, salary: 40000, bakery_id: @bakery_2.id)
    visit "/bakeries/#{@bakery_1.id}"
  end

  it 'list bakery names' do

    expect(page).to have_content('Tim Hortons')
    expect(page).to have_content('false')
    expect(page).to have_content('5')
    expect(page).to have_content('0')
    expect(page).to_not have_content('Starbucks')
  end

  it 'redirects to correct path' do
    expect(page).to have_current_path("/bakeries/#{@bakery_1.id}")
  end

  it 'redirects to correct path after deleting' do
    click_on 'Delete'
    expect(page).to have_current_path("/bakeries/")
  end

  it 'deletes a bakery' do
    click_on 'Delete'
    expect(page).to have_content("Starbucks")
    expect(page).to_not have_content("Tim Hortons")
  end

  it 'deletes bakers associated with respective bakery' do
    click_on 'Delete'
    visit '/bakers/'
    expect(page).to_not have_content("Joe Shmoe")

  end
end
