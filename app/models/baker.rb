class Baker < ApplicationRecord

  def bakery
    bakery = Bakery.find(self.bakery_id)
    bakery.name
  end

end
