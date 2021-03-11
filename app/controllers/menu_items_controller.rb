class MenuItemsController < ApplicationController
  before_action :authorize_user!,only:[:edit,:update,:destroy]
  include MenuItemsHelper
  def new
    @menu_item = MenuItem.new
  end

  def create
    menu_item = MenuItem.new(menu_item_params)
    category = Category.find_or_create_by(name: params[:category])
    menu_item_category = MenuItemCategory.create(menu_item: menu_item,category:category)
    if menu_item.save
      flash[:notice]="Item created successfully!"
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
      elsif @sort == "most_reviewed"
        @menu_items = MenuItem.joins(:reviews).group(:id).order("COUNT(reviews.id) DESC")
      else
        @menu_items = MenuItem.order(created_at: :desc)
      end
      
    elsif @search
      @menu_items = MenuItem.where("title ilike ?", "%#{@search}%")
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
    @menu_item = MenuItem.find(params[:id])
    @menu_item.destroy
    redirect_to menu_items_path
    
  end

  def edit
    @menu_item = MenuItem.find(params[:id])
    
  end

  def update
    @menu_item = MenuItem.find(params[:id])
    if @menu_item.update menu_item_params
      flash[:notice] = 'Item updated successfully'
      redirect_to menu_item_path(@menu_item)
    else
      render :edit
    end

  end

  def price_search
    @menu_items = MenuItem.where("price <= ?", params[:query])
    render partial: 'menu_items/menu_items', locals: { menu_items: @menu_items }, layout: false
  end


  private
  def menu_item_params
    params.require(:menu_item).permit(:title,:description,:price,:image,:menutype_id,:menutype,:category)
  end

  def authorize_user!
    redirect_to root_path, alert: 'Not Authorized' unless can?(:crud, @menu_item)
end
end
