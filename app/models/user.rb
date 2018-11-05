class User < ApplicationRecord
  has_many :image, as: :imageable
  has_many :categories
  has_many :songs
  has_many :albums
  has_many :authors
  has_many :singers
  has_many :lyrics
  has_many :likes
  has_many :comments
  has_many :reports
end
