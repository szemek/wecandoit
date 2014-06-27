class Link < ActiveRecord::Base
  validates :title, :address, :presence => true

  belongs_to :user

  acts_as_taggable
end
