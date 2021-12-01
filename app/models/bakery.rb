class Bakery < ApplicationRecord

  def bakers
    Baker.where(bakery_id: self.id)
  end

  def baker_count
    self.bakers.count
  end


end
