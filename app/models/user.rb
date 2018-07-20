class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable

  has_many :comments

  mount_uploader :avatar, AvatarUploader
  
  def admin?
    self.role == "admin"
  end

  def user_name
    self.email.split('@').first
  end
end
