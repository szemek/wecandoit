class Guide < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders, :history]

  validates :title, :content, :presence => true

  belongs_to :user

end
