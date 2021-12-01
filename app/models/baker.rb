class Baker < ApplicationRecord

  def bakery
    Bakery.find(self.bakery_id)
  end

end
