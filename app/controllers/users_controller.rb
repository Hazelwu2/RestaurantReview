class UsersController < ApplicationController
  before_action :set_user

  def show
  end

  def edit
    
  end

  def update
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :intro, :avatar)
  end
end
