# encoding: UTF-8
class MessageDecorator < Draper::Decorator
  include Draper::LazyHelpers

  def to_hash
    hash = {}

    hash[:id] = model.id
    hash[:channel] = model.channel
    hash[:content] = model.content
    hash[:username] = model.username

    hash
  end
end
