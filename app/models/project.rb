class Project < ActiveRecord::Base
  attr_accessible :repo, :username, :website, :gravatar, :description, :last_commit_date, :last_commit_message

  belongs_to :user

  store :github_data, accessors: [:gravatar, :description, :last_commit_date, :last_commit_message]
end
