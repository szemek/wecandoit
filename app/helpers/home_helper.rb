module HomeHelper
  def last_link
    link = Link.last
    link_to(link.title, links_path) if link
  end

  def last_guide
    guide = Guide.last
    link_to(guide.title, guide) if guide
  end
end
