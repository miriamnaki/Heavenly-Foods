module ShoppingCartItemsHelper
  def last_four_digits(user)
    stripe_customer = Stripe::Customer.retrieve(user.stripe_id)
    card_id = stripe_customer.default_source
    card = Stripe::Customer.retrieve_source(user.stripe_id, card_id)
    card.last4
  end
end
