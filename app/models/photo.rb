class Photo < ActiveRecord::Base
  attr_accessible :description, :picture

  mount_uploader :picture, PictureUploader
end
