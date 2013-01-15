# encoding: UTF-8
class PostDecorator < Draper::Decorator
  include Draper::LazyHelpers

  def as_json(options = {})
    hash = {}

    hash['avatar'] = model.user.avatar_url
    hash['username'] = model.user.username
    hash['date'] = localize(model.date.in_time_zone(ActiveSupport::TimeZone.new('Warsaw')))
    hash['distance'] = distance_of_time_in_words(Time.now, model.created_at)
    hash['comment'] = raw auto_link(model.content.gsub("\n","<br/>"))
    hash['actions'] = "#{link_to('Edytuj', edit_post_path(model), :class => "btn btn-success") if can?(:edit, model)}"
    hash['actions']+= "#{link_to('Usuń', post_path(model), :confirm => 'Na pewno?', :method => :delete, :class => 'btn btn-danger') if can?(:edit, model)}"

    hash
  end
end
