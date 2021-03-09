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
    final_total = 0
    shopping_cart_items.all do |item|
      final_total = item.subtotal + item.tax + item.delivery_fee
    end
      return final_total
  end


end
