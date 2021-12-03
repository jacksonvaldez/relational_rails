require 'rails_helper'

RSpec.describe 'Create Bakery Form' do

  before(:each) do
    visit '/bakeries/new'
    fill_in('bakery[name]', with: 'Dunkin Donuts')
    fill_in('bakery[customer_capacity]', with: '50')

    click_button()
  end

  it 'takes you to correct path' do
    expect(page).to have_current_path("/bakeries/")
  end

  it 'lists a new bakery' do
    expect(page).to have_content('Dunkin Donuts')
  end

  it 'saves customer_capacity attribute' do
    click_on 'Dunkin Donuts'
    expect(page).to have_content('50')
  end

end
