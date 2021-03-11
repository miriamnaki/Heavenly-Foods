class User < ApplicationRecord
  has_secure_password
  has_many :bookings
  has_many :reviews
  has_one :shopping_cart
  has_many :menu_items, dependent: :nullify

  def shopping_cart_items_count
    shopping_cart = ShoppingCart.find_or_create_by(user: self)
    shopping_cart.shopping_cart_items.count
  end
end
