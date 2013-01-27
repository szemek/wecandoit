# encoding: utf-8
xml.instruct! :xml, version: "1.0"
xml.rss version: "2.0" do
  xml.channel do
    xml.title "WeCanDoIt wall"
    xml.description "Ruby Wednesday working group"
    xml.link wall_path

    @posts.each do |post|
      xml.item do
        xml.title "#{post.user.username} napisał(a)"
        xml.description post.content
        xml.pubDate post.updated_at.to_s(:rfc822)
      end
    end
  end
end

