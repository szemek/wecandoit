# encoding: UTF-8
class MessageDecorator < Draper::Base
  include Draper::LazyHelpers

  decorates :message

  def to_hash
    hash = {}

    hash[:channel] = channel
    hash[:content] = content
    hash[:username] = username

    hash
  end
end
