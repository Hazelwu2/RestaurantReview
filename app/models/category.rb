class Category < ApplicationRecord
  validates_presence_of :name
  
  # 若分類下已有餐廳，即使餐廳刪除，也不允許刪除分類（會拋出Error）
  has_many :restaurants, dependent: :restrict_with_error
end
