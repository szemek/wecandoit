class Link < ActiveRecord::Base
  attr_accessible :title, :address, :description, :tag_list

  validates :title, :address, :presence => true

  belongs_to :user

  acts_as_taggable
end
