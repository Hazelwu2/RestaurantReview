class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable

  # 如果 User 已經有了評論，就不允許刪除帳號（刪除時拋出 Error）
  # 使用者可評論很多餐廳 多對多關聯
  has_many :comments, dependent: :restrict_with_error
  has_many :restaurants, through: :comments, dependent: :destroy

  # 使用者可收藏很多餐廳 多對多關聯
  has_many :favorites, dependent: :destroy
  has_many :favorited_restaurants, through: :favorites, source: :restaurant

  # 頭像上傳
  mount_uploader :avatar, AvatarUploader
  
  def admin?
    self.role == "admin"
  end

  def user_name
    self.name ||= self.email.split('@').first
  end
end
