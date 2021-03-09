class ShoppingCartItem < ApplicationRecord
  belongs_to :shopping_cart
  belongs_to :menu_item

  def subtotal
    quantity * menu_item.price
  end

   def tax
    subtotal = quantity * menu_item.price
    0.12 * subtotal
   end

   def delivery_fee
    subtotal = quantity * menu_item.price
    0.07 * subtotal
   end
end
