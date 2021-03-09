class BillingsController < ApplicationController
  def new
    @billing = Billing.new
  end
  
  def create
    @billing = Billing.new(billing_params)
    if @billing.save
      redirect_to shopping_cart_items_path
    else
      render :new
    end

  end

  private
  def billing_params
    params.require(:billing).permit(:first_name,:last_name,:country,:street_address,
      :unit,:city,:province,:postal_code,:phone,:email)
  end


end
