class Project < ActiveRecord::Base
  belongs_to :user

  store :github_data, accessors: [:gravatar, :description, :last_commit_date, :last_commit_message]
end
