class Review < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :menu_item
  has_many :replies
end
