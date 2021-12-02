require 'rails_helper'

RSpec.describe Baker do
  before(:each) do
    @bakery = Bakery.create!(name: "Dunkin Donuts", is_open: false, customer_capacity: 10)
    @baker_1 = Baker.create!(name: 'Jon Doe', is_working: true, salary: 10000, bakery_id: @bakery.id)
  end

  it 'attributes' do
    expect(@baker_1.name).to eq('Jon Doe')
    expect(@baker_1.is_working).to eq(true)
    expect(@baker_1.salary).to eq(10000)
    expect(@baker_1.created_at).to be_a(ActiveSupport::TimeWithZone)
    expect(@baker_1.updated_at).to be_a(ActiveSupport::TimeWithZone)
    # expect(artist.created_at).to be_an(50000)
  end

  describe 'bakery' do
    it 'returns the place of employment' do
      expect(@baker_1.bakery).to eq(@bakery)
    end
  end
end
