class Category < ApplicationRecord
  belongs_to :user
  has_many :songs
  scope :by_name_cate, -> {order :name}
end
