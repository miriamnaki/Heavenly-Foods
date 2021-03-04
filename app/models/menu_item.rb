class MenuItem < ApplicationRecord
  has_one_attached :image
  has_many :menu_item_categories
  has_many :categories, through: :menu_item_categories
  has_many :reviews
  has_many :menu_item_tags
  has_many :tags, through: :menu_item_tags
end
