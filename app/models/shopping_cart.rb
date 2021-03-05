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
end
