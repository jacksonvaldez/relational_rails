require 'rails_helper'

RSpec.describe 'clickable links' do
  it 'takes you to correct page' do

    visit '/artists'

    expect(page).to have_current_path('/artists')
  end

  it 'takes you to correct page' do

    visit '/songs'

    expect(page).to have_current_path('/songs')
  end

  it 'takes you to correct page' do

    visit '/bakeries'

    expect(page).to have_current_path('/bakeries')
  end

  it 'takes you to correct page' do

    visit '/bakers'

    expect(page).to have_current_path('/bakers')
  end
end
