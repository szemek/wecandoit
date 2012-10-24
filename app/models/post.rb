class Post < ActiveRecord::Base
  attr_accessible :content #, :name

  validates :content, :presence => true

  belongs_to :user
end
