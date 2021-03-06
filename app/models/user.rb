class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true
  validates :name, presence: true
  has_many :pets
end
