class Song < ApplicationRecord
  include Filterable
  belongs_to :user
  belongs_to :category
  has_many :lyrics, dependent: :destroy
  has_many :album_songs
  has_many :albums, through: :album_songs, dependent: :destroy
  has_many :author_songs
  has_many :authors, through: :author_songs, dependent: :destroy
  has_many :singer_songs
  has_many :singers, through: :singer_songs, dependent: :destroy
  has_many :comments
  has_many :likes
  scope :order_at, -> {order created_at: :desc}
  delegate :name, to: :category, prefix: true

  mount_uploader :song_url, AudioUploader

  validates :name, presence: true, length:
    {maximum: Settings.validates.name.maximum}
  validates :song_url, presence: true

  accepts_nested_attributes_for :authors, :singers,
    reject_if: proc {|attributes| attributes["name"].blank?}
  scope :get_song, (lambda do
    all.order("created_at asc").limit(Settings.get_song.limit)
  end)
  scope :_name, -> {order :name}
  
  class << self
    def search search
      unless search.present?
        Song.all
      else
        where("songs.name LIKE '%#{search}%' ")
      end
    end
  
    def filter_category_id search
      Song.where(category_id: search) if search.present?
    end
  
    def filter_author_id search
      Song.joins(:authors).where("authors.id = ?", search) if search.present?
    end
  
    def filter_singer_id search
      Song.joins(:singers).where("singers.id = ?", search) if search.present?
    end

    def sort_name search
      Song.all.order(name: :desc) if search.present?
    end
  end
end
