class CreateBakery < ActiveRecord::Migration[5.2]
  def change
    create_table :bakeries do |t|
      t.string :name
      t.boolean :is_open
      t.integer :customer_capacity
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
