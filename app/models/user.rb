require 'bcrypt'

class User < ApplicationRecord

  has_many :photos
  has_many :articles
  has_many :photos
  has_many :categories

  def password
    @password ||= BCrypt::Password.new(self.password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end


end
