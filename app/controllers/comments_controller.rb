class CommentsController < ApplicationController
  before_action :set_restaurant

  def create
    @comment = @restaurant.comments.build(comment_params)
    @comment.user = current_user
    @comment.save!
    flash[:notice] = "已成功評論 #{@restaurant.name} "
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @comment = Comment.find(params[:id])
    if current_user.admin?
      @comment.destroy
      flash[:notice] = "已成功刪除 #{@comment.user.name} 的評論"
      redirect_to restaurant_path(@restaurant)
    end
  end
  
  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
