class Transaction < ApplicationRecord
  belongs_to :user

  def self.create_receipt(shopping_cart,total)
    transaction = Transaction.new(user: shopping_cart.user, total:total)
    menu_items = {}
    shopping_cart.shopping_cart_items.each do |cart_item|
      menu_items[cart_item.menu_item.title] = {
        price: cart_item.menu_item.price,
        quantity: cart_item.quantity
      }
    end
    transaction.menu_items = menu_items
    transaction.save
    transaction
  end
end
