class MenuItemsController < ApplicationController
  def new
    @menu_item = MenuItem.new
  end

  def create
    menu_item = MenuItem.new(menu_item_params)
    if menu_item.save
      redirect_to menu_item_path(menu_item)
    else
      redirect_to new_menu_item_path
    end
  end

  def index
    @menu_items = MenuItem.order(created_at: :desc)
  end

  def show
    @menu_item = MenuItem.find(params[:id])
    @review = Review.new
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
