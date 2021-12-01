class CreateSong < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :name
      t.boolean :top_100
      t.integer :length_s
      t.integer :artist_id # Refactor with ActiveRecord Associations at the end
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
