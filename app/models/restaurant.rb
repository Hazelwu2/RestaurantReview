class Restaurant < ApplicationRecord
  validates_presence_of :name
  belongs_to :category

  # CarrierWave 上傳圖片
  mount_uploader :image, PhotoUploader
end
