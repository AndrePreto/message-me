class User < ApplicationRecord
  has_many :messages

  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }
  validates :password, presence: true, length: { minimum: 3, maximum: 50 }

  has_secure_password
end
