# encoding: UTF-8
class PostDecorator < Draper::Base
  include Draper::LazyHelpers

  decorates :post

  def as_json(options = {})
    hash = {}

    hash['avatar'] = user.avatar_url
    hash['username'] = user.username
    hash['date'] = localize(date.in_time_zone(ActiveSupport::TimeZone.new('Warsaw')))
    hash['distance'] = distance_of_time_in_words(Time.now, date)
    hash['comment'] = raw auto_link(content.gsub("\n","<br/>"))
    hash['actions'] = "#{link_to('Edytuj', edit_post_path(post), :class => "btn btn-success") if can?(:edit, post)}"
    hash['actions']+= "#{link_to('Usuń', post_path(post), :confirm => 'Na pewno?', :method => :delete, :class => 'btn btn-danger') if can?(:edit, post)}"

    hash
  end
end
