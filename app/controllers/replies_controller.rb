class RepliesController < ApplicationController
  
  
  def create
    reply = Reply.new(reply_params)
    @user = User.find_by  params[:user_id]
    if reply.save
      redirect_to menu_item_path(reply.review.menu_item)
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:user_id, :review_id, :message)
  end
end
