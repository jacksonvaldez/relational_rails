class Bakery < ApplicationRecord
  has_many :bakers

  def baker_count
    self.bakers.count
  end

end
