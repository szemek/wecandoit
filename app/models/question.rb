class Question < ActiveRecord::Base
  attr_accessible :content, :title

  has_many :answers
  belongs_to :user
end
