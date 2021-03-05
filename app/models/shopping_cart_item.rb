class ShoppingCartItem < ApplicationRecord
  belongs_to :shopping_cart
  belongs_to :menu_item

  def subtotal
    quantity * menu_item.price
  end
end
