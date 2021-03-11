class Review < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :menu_item
end
