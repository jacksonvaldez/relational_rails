class Bakery < ApplicationRecord

  def bakers
    # binding.pry
    Baker.all.to_a.find_all do |baker|
      # binding.pry
      baker.bakery_id == self.id

    end
  end

end
