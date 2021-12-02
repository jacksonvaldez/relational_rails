require 'rails_helper'

RSpec.describe Bakery do
  it {should have_many :bakers}

  before(:each) do
    @bakery = Bakery.create!({ name: 'Dunkin Donutes', is_open: false, customer_capacity: 20 })
    @baker_1 = Baker.create!(name: 'jon smith', is_working: false, salary: 10000, bakery_id: @bakery.id)
    @baker_2 = Baker.create!(name: 'andrew jackson', is_working: true, salary: 15000, bakery_id: @bakery.id)
  end
  it 'attributes' do
    expect(@bakery.name).to eq('Dunkin Donutes')
    expect(@bakery.is_open).to eq(false)
    expect(@bakery.customer_capacity).to eq(20)
    expect(@bakery.created_at).to be_a(ActiveSupport::TimeWithZone)
    expect(@bakery.updated_at).to be_a(ActiveSupport::TimeWithZone)
    # expect(artist.created_at).to be_an(50000)
  end

  describe '#bakers' do
    it 'returns a collection of bakers' do
      # binding.pry
      expect(@bakery.bakers).to eq([@baker_1, @baker_2])
    end
  end

  describe '#baker_count' do
    it 'returns the count of bakers that the artist has' do
      expect(@bakery.baker_count).to eq(2)
    end
  end
end
