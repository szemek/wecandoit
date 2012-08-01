class User < ActiveRecord::Base
  attr_accessible :username, :avatar_url

  has_many :questions
  has_many :answers
end
