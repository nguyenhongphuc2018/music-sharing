class Singer < ApplicationRecord
  belongs_to :user
  has_many :images, as: :imageable
  has_many :singer_songs
  has_many :songs, through: :singer_songs
end
