class CreateArtist < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name
      t.boolean :alive
      t.integer :monthly_listeners
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
