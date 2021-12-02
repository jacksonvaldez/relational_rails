class CreateBaker < ActiveRecord::Migration[5.2]
  def change
    create_table :bakers do |t|
      t.string :name
      t.boolean :is_working
      t.integer :salary
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
