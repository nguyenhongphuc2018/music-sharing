class Author < ApplicationRecord
  has_many :images, as: :imageable
  belongs_to :user
  has_many :author_songs
  has_many :songs, through: :author_songs
  validates :name, presence: true, length: {maximum: Settings.validates.name.maximum}
  scope :_name, -> {order :name}
end
