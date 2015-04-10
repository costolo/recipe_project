class User < ActiveRecord::Base
  has_many :votes
  has_many :recipes
  has_many :comments
end
