class Message
  include Mongoid::Document
  field :channel, type: String
  field :content, type: String

  after_save :push_message

  private
    def push_message
      if Rails.env == 'production'
        Pusher[self.channel].trigger('message', MessageDecorator.decorate(self).to_hash)
      end
    end
end
