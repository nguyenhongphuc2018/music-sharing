class Song < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one :lyric
  has_many :album_songs
  has_many :albums, through: :album_songs
  has_many :author_songs
  has_many :authors, through: :author_songs
  has_many :singer_songs
  has_many :singers, through: :singer_songs
  has_many :comments
  has_many :likes

  mount_uploader :song_url, AudioUploader

  validates :name, presence: true, length:
    {maximum: Settings.validates.name.maximum}
  validates :song_url, presence: true

  accepts_nested_attributes_for :authors, :singers,
    reject_if: proc {|attributes| attributes["name"].blank?}
end
