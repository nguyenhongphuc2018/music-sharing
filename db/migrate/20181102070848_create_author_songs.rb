class CreateAuthorSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :author_songs do |t|
      t.references :author, foreign_key: true
      t.references :song, foreign_key: true
      t.timestamps
    end
  end
end
