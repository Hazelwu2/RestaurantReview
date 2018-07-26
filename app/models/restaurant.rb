class Restaurant < ApplicationRecord
  validates_presence_of :name
  has_many :comments, dependent: :destroy
  belongs_to :category

  # 收藏餐廳 多對多關聯
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  
  # CarrierWave 上傳圖片
  mount_uploader :image, PhotoUploader
end
