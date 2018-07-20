class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable

  has_many :comments

  def admin?
    self.role == "admin"
  end

  def name
    self.email.split('@').first
  end
end
