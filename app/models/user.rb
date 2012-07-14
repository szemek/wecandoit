class User < ActiveRecord::Base
  attr_accessible :username, :avatar_url
end
