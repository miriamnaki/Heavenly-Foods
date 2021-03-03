class MenuItem < ApplicationRecord
  has_one_attached :image
  has_many :menu_item_categories
  has_many :categories, through: :menu_item_categories
  has_many :reviews
end
