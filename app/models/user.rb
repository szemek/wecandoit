class User < ActiveRecord::Base
  has_many :questions
  has_many :answers

  has_many :projects
  has_many :guides
  has_many :links

  has_many :posts
end
