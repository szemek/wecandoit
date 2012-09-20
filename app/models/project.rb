class Project < ActiveRecord::Base
  attr_accessible :repo, :user

  belongs_to :user
end
