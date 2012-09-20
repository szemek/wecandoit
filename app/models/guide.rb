class Guide < ActiveRecord::Base
  attr_accessible :content, :seo_url, :title

  validates :title, :content, :presence => true

  belongs_to :user
end
