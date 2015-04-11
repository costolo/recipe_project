class User < ActiveRecord::Base
  has_secure_password

  validates :name, uniqueness: true

  #test
  has_many :votes
  has_many :recipes
  has_many :comments
end
