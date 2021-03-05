class CategoriesController < ApplicationController
  def show
    category = Category.find(params[:id])
    @menu_item_categories = MenuItemCategory.where(category:category)
  end
end
