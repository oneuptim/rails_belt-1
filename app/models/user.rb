class User < ApplicationRecord
  has_secure_password
  has_many :likes
  has_many :ideas, dependent: :destroy
  has_many :ideas, through: :likes, dependent: :destroy


 EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
 validates :first_name, :last_name, :password, presence: true, length: { in: 2..20 }
 validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
