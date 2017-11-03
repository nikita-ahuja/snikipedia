class User < ApplicationRecord
  has_secure_password

  validates :username, :email, :password, presence: true
  validates :email, uniqueness: true

  has_many :photos, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :categories

end
