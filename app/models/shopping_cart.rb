class ShoppingCart < ApplicationRecord
  belongs_to :user
  has_many :shopping_cart_items

  def subtotal
    total = 0
    shopping_cart_items.each do |item|
      total += item.subtotal
    end
    return total
  end

  def final_total
    subtotal + delivery_fee + tax
  end

  def delivery_fee
    0.07 * subtotal
   end

   def tax
    0.12 * subtotal
   end


end
