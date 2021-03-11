class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @menu_item = MenuItem.find params[:menu_item_id]
    @review = Review.new review_params
    @review.menu_item = @menu_item
    @review.user = current_user
    if @review.save
      flash[:notice] ='Thanks for your review.'
      redirect_to menu_item_path(@menu_item)
    else
      redirect_to menu_item_path(@menu_item)
    end

  end

  def show
  end

  def edit
  end

  def update
  end

 def destroy
  @menu_item = MenuItem.find(params[:menu_item_id])
  @review = Review.find(params[:id])
    if can?(:crud, @review)
      @review.destroy
      flash[:notice] = "Review deleted"
      redirect_to menu_item_path(@menu_item)
    else
      flash[:notice] = 'You cant delete a review you dont own.'
      redirect_to menu_items_path
    end
 end

 private
 def review_params
  params.require(:review).permit(:rating,:body)
 end
end
