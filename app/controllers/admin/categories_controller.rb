class Admin::CategoriesController < ApplicationController
  before_action :authenticate_admin
  before_action :set_category, only: [:delete, :edit]
  def index
    @categories = Category.all

    if params[:id]
      set_category
    else
      @category = Category.new
    end
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "成功建立分類"
      redirect_to admin_categories_path
    else
      @categories = Category.all
      render :index
      flash.now[:alert] = "建立分類失敗"
    end
  end

  def edit
    set_category
  end

  def update
    set_category
    if @category.update(category_params)
      redirect_to admin_categories_path
      flash[:notic] = "Category成功更新"
    else
      @categories = Category.all
      render :index
    end
  end

  def destroy
    set_category
    @category.destroy
    flash[:alert] = "分類已成功刪除"
    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
