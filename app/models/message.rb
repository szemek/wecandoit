class Message
  include Mongoid::Document
  field :channel, type: String
  field :content, type: String
end
