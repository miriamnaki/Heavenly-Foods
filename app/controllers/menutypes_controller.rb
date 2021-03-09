class MenutypesController < ApplicationController

  def new
    menu_type = Menutype.new
  end
  
  def create
    # @menu_item = MenuItem.find params[:menu_item_id]
    @menu_type = Menutype.new menutype_params
    # @menu_type.menu_item = @menu_item
    if @menu_type.save
      redirect_to menutypes_path
    else
      render :new

    end
  end

  def index
    @menu_types = Menutype.order(created_at: :desc)
    @menu_items = MenuItem.order(created_at: :desc)
  
    
  end

  def show
    @menu_type = Menutype.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def menutype_params
    params.require(:menutype).permit(:menutype)
  end
end

