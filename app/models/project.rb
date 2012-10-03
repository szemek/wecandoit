class Project < ActiveRecord::Base
  attr_accessible :repo, :username, :website

  belongs_to :user
end
