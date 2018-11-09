class Category < ApplicationRecord
  belongs_to :user
  has_many :songs, dependent: :destroy
  scope :by_name_cate, -> {order :name}
end
