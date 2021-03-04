class MenuItemTag < ApplicationRecord
  belongs_to :tag
  belongs_to :menu_item
end
