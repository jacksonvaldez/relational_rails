class Bakery < ApplicationRecord
  has_many :bakers, dependent: :destroy

  def baker_count
    self.bakers.count
  end

end
