class BillingsController < ApplicationController
  def new
    @billing = Billing.new
  end
  
  def create
    @billing = Billing.new(billing_params)
    if @billing.save
      flash[:notice] = 'Your billing information has been saved.'
      redirect_to new_payment_path
    else
      render :new
    end

  end

  def new_card
    respond_to do |format|
      format.js
    end
  end

  def create_card
    respond_to do |format|
      if current_user.stripe_id.nil?
        customer = Stripe::Customer.create({"email": current_user.email}) 
        #here we are creating a stripe customer with the help of the Stripe library and pass as parameter email. 
        current_user.update(:stripe_id => customer.id)
        #we are updating current_user and giving to it stripe_id which is equal to id of customer on Stripe
      end

      card_token = params[:stripeToken]
      #it's the stripeToken that we added in the hidden input
      if card_token.nil?
        format.html { redirect_to billing_path, error: "Oops"}
      end
      #checking if a card was giving.

      customer = Stripe::Customer.new current_user.stripe_id
      customer.source = card_token
      #we're attaching the card to the stripe customer
      customer.save
       flash[:alert] = 'You have successfully added a card to your account'
      format.html { redirect_to final_order_shopping_cart_items_path }
    end
  end

    def success
    end

    def pay
      items = current_user.shopping_cart.shopping_cart_items.map do |shopping_cart_item|
        shopping_cart_item.menu_item.title
      end.join(', ')
      total = (current_user.shopping_cart.final_total.round(2) * 100).to_i
      Stripe::Charge.create({
        amount: total,
        currency: 'cad',
        description: items,
        customer: current_user.stripe_id
      })
      transaction = Transaction.create_receipt(current_user.shopping_cart, total)
      current_user.shopping_cart.shopping_cart_items.map(&:destroy)
      redirect_to transaction_path(transaction)
    end

    def receipt
    end

  private

  def billing_params
    params.require(:billing).permit(:first_name,:last_name,:country,:street_address,
      :unit,:city,:province,:postal_code,:phone,:email)
  end


end
