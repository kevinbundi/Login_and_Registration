class User < ActiveRecord::Base
  has_secure_password
  validates :name, :email, :password, presence: true
  validates :password, length: { minimum: 4 }
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  before_save do
  	self.email.downcase!
  end 
end
