class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def authenticate_admin
    unless current_user.admin?
      flash[:alert] = "未有權限，不允許登入"
      redirect_to root_path
    end
  end
end
