class User < ActiveRecord::Base
  attr_accessible :username, :avatar_url

  has_many :questions
  has_many :answers

  has_many :projects
  has_many :guides
  has_many :links

  has_many :posts
end
