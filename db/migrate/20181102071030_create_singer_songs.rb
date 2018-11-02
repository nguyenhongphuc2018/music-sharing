class CreateSingerSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :singer_songs do |t|
      t.references :singer, foreign_key: true
      t.references :song, foreign_key: true
      t.timestamps
    end
  end
end
