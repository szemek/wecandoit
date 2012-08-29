class Link < ActiveRecord::Base
  attr_accessible :title, :address, :description

  validates :title, :address, :presence => true
end
