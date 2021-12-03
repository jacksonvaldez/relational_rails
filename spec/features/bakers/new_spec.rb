require 'rails_helper'

RSpec.describe 'Create Bakery Form' do

  before(:each) do
    @dunkin = Bakery.create!(name: 'Dunkin Donuts', is_open: true, customer_capacity: 6)
    visit "/bakeries/#{@dunkin.id}/bakers/new"
    fill_in('baker[name]', with: 'Mike Dao')
    fill_in('baker[salary]', with: '125000')

    click_button()
  end

  it 'takes you to correct path' do
    expect(page).to have_current_path("/bakeries/#{@dunkin.id}/bakers")
  end

  it 'lists a new baker' do
    expect(page).to have_content('Mike Dao')
  end

  it 'saves customer_capacity attribute' do
    expect(page).to have_content('125000')
  end

end
