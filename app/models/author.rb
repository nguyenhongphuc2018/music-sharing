class Author < ApplicationRecord
  has_many :images, as: :imageable
  belongs_to :user
  has_many :author_songs
  has_many :songs, through: :author_songs
end
