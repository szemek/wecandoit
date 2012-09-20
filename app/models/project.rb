class Project < ActiveRecord::Base
  attr_accessible :repo, :username

  belongs_to :user
end
