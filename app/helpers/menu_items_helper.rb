module MenuItemsHelper
  def menu_item_sort_options
    [['created at','created_at_desc'],['price(high to low)','price_desc'],
    ['price(low to high)','price_asc'],['most reviewed','most_reviewed']]
  end

  def menu_item_sort_path(sort)
    url_for(params.permit!.merge(sort:sort))
  end

end
