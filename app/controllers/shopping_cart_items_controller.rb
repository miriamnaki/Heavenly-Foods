class ShoppingCartItemsController < ApplicationController
  before_action :redirect_unless_signed_in
  def create
    shopping_cart = ShoppingCart.find_or_create_by(user: current_user)
    shopping_cart_item = ShoppingCartItem.new(shopping_cart_item_params)
    shopping_cart_item.shopping_cart = shopping_cart
    if shopping_cart_item.save
      flash[:notice] ='Item added to cart'
      redirect_to shopping_cart_items_path
    else
      redirect_to menu_item_path(shopping_cart_item.menu_item)
    end
  end

  def add
    shopping_cart = ShoppingCart.find_or_create_by(user: current_user)
    @menu_item = MenuItem.find(params[:menu_item_id])
    if (shopping_cart_item = shopping_cart.shopping_cart_items.find_by(menu_item: @menu_item))
      shopping_cart_item.quantity +=1
      shopping_cart_item.save
    else
      shopping_cart_item = ShoppingCartItem.create(shopping_cart: shopping_cart, menu_item: @menu_item ,quantity: 1)
    end
  end
  
  def index
    @shopping_cart = ShoppingCart.find_or_create_by(user: current_user)
  end

  
  def update
  end
  def destroy
    @shopping_cart_item = ShoppingCartItem.find params[:id]
    
    @shopping_cart_item.destroy
    redirect_to shopping_cart_items_path
  end

  def final_order
    @shopping_cart = ShoppingCart.find_or_create_by(user: current_user)
  end

  private
  def shopping_cart_item_params
    params.require(:shopping_cart_item).permit(:quantity,:menu_item_id)
  end
  
end
