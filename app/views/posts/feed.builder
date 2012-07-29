xml.instruct! :xml, :version=>"1.0" 
xml.rss(:version=>"2.0"){
  xml.channel{
    xml.title t("rss.recent_posts_title", :name => Setting.app_name)
    xml.link root_url
    xml.description(t("rss.recent_posts_description", :name => Setting.app_name ))
    xml.language('zh-cn')
      for post in @posts
        xml.item do
          xml.title post.title
          xml.description raw(post.body_html)
          xml.author raw(SiteConfig.site_author)
          xml.pubDate(post.created_at.strftime("%a, %d %b %Y %H:%M:%S %z"))
          xml.link post_url post
          xml.guid post_url post
        end
      end
  }
}