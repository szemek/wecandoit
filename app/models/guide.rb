class Guide < ActiveRecord::Base
  validates :title, :content, :presence => true

  belongs_to :user

  extend FriendlyId
    friendly_id :title, use: [:slugged, :history]
end
