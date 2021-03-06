class MenuItemsController < ApplicationController
  include MenuItemsHelper
  def new
    @menu_item = MenuItem.new
  end

  def create
    menu_item = MenuItem.new(menu_item_params)
    category = Category.find_or_create_by(name: params[:category])
    menu_item_category = MenuItemCategory.create(menu_item: menu_item,category:category)
    if menu_item.save
      redirect_to menu_item_path(menu_item)
    else
      redirect_to new_menu_item_path
    end
  end

  def index
    @sort = params[:sort]
      @search = params[:search]
    if @sort
      if @sort == 'price_asc'
        @menu_items = MenuItem.order(price: :asc)
      elsif @sort == 'price_desc'
        @menu_items = MenuItem.order(price: :desc)
      else
        @menu_items = MenuItem.order(created_at: :desc)
      end
      
    elsif @search
      @menu_items = MenuItem.where("title like ?", "")
    else
      @menu_items = MenuItem.order(created_at: :desc)
    end
  end

  def show
    @menu_item = MenuItem.find(params[:id])
    @review = Review.new
    @shopping_cart_item = ShoppingCartItem.new
    @reviews = @menu_item.reviews.order(created_at: :desc)

  end

  def destroy
    
  end

  def edit
  end

  def update
  end


  private
  def menu_item_params
    params.require(:menu_item).permit(:title,:description,:price,:image)
  end
end
