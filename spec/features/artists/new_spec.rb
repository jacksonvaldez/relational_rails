require 'rails_helper'

RSpec.describe 'Create Artist Form' do

  before(:each) do
    visit '/artists/new'
    fill_in('artist[name]', with: 'Debby')
    fill_in('artist[monthly_listeners]', with: '12345')

    click_button()
  end

  it 'takes you to correct path' do
    expect(page).to have_current_path("/artists/")
  end

  it 'lists a new artist' do
    expect(page).to have_content('Debby')
  end

  it 'saves monthly_listeners attribute' do
    click_on 'Debby'
    expect(page).to have_content('12345')
  end
  
end
