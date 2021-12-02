class AddBakeriesToBakers < ActiveRecord::Migration[5.2]
  def change
    add_reference :bakers, :bakery, foreign_key: true
  end
end
