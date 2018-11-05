class Album < ApplicationRecord
  belongs_to :user
  has_many :images, as: :imageable
  has_many :album_songs
  has_many :songs, through: :album_songs
end
