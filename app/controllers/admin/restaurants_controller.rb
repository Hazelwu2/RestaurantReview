class Admin::RestaurantsController < ApplicationController
  before_action :authenticate_admin
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.page(params[:page]).per(10)
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:notice] = "餐廳資料已成功建立"
      redirect_to admin_restaurant_path(@restaurant)
    else
      flash.now[:alert] = "很抱歉，餐廳未成功建立"
      render :new
    end

  end

  def update
    if @restaurant.update(restaurant_params)
      flash[:notice] = "餐廳資料成功更新"
      redirect_to admin_restaurant_path(@restaurant)
    else
      flash.now[:alert] = "更新失敗"
      render :edit
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to admin_restaurants_path
    flash[:alert] = "刪除成功"
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :opening_hours, :tel, :address, :description, :image, :category_id)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
