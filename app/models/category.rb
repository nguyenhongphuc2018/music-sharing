class Category < ApplicationRecord
  belongs_to :user
  has_many :songs
  validates :name, presence: true
  validates :info, presence: true
  scope :select_fields, ->{includes(:songs).select :id, :name, :info, :created_at}
  scope :by_lastest,->{order created_at: :desc}
  scope :_name, -> {order :name}
end
