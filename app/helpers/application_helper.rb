module ApplicationHelper
  def markdown(text)
    options = {
      :hard_wrap => true,
      :filter_html => true,
      :autolink => true,
      :space_after_headers => true,
      :fenced_code_blocks => true,
      :no_intraemphasis => true,
      :fenced_code => true,
      :gh_blockcode => true
    }
    markdown = Redcarpet::Markdown.new(PygmentizeHTML, options)
    markdown.render(text).html_safe
  end

  def nav_helper(arg)
    controller_name == arg
  end

  def time_in_poland(date)
    date.in_time_zone(ActiveSupport::TimeZone.new('Warsaw'))
  end
end

class PygmentizeHTML < Redcarpet::Render::HTML
  def block_code(code, language)
    require 'pygmentize'
    Pygmentize.process(code, language)
  end
end
