require 'rails_helper'

RSpec.describe Artist do
  describe 'instance methods' do
    it 'attributes' do
      artist = Artist.new({ name: 'Prince', alive: false, monthly_listeners: 50_000 })
      expect(artist.name).to eq('Prince')
      expect(artist.alive).to eq(false)
      expect(artist.monthly_listeners).to eq(50000)
      binding.pry
      # expect(artist.created_at).to be_an(50000)
    end
  end
end
