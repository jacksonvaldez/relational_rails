require 'rails_helper'

RSpec.describe 'list of all bakeries' do
  it 'lists bakeries' do
    bakery_1 = Bakery.create!(name: "Dunkin Donuts", is_open: false, customer_capacity: 10)
    visit '/bakeries'

    expect(page).to have_content('Dunkin Donuts')
  end
end
