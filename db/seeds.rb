# coding: utf-8

# 默认配置项
# 如需新增设置项，请在这里初始化默认值，然后到后台修改


# site title ,slogan and author HTML
SiteConfig.save_default("site_title","Iceylog")
SiteConfig.save_default("site_slogan","Focus on Android,iPhone,Web,Business,Architecture,Agile,Technic and beyond…")
SiteConfig.save_default("site_author","Icey")
SiteConfig.save_default("site_author_username","iceylog")
SiteConfig.save_default("site_author_password","password")

# Footer HTML
SiteConfig.save_default("about_me_html",<<-eos
<div class="about">
  <p>IceskYsl, 简称Ice, 80后, 典型巨蟹男, 移动互联网创业者; Google产品重度依赖者, Mac, Android, iPhone, BB 非典型用户;关注创新,技术,产品和一切新奇的玩意儿; <br />求学武汉, 毕业南下深圳, 尔后北漂在京, 至今数年有余; 追寻内心的想法, 不随波逐流, 爱折腾, 爱旅行, 孩子气, 享受工作, 安静的做喜欢的事情...</p>
</div>
eos
)

# menu HTML
SiteConfig.save_default("menu_html",<<-eos
  	<ul>
 			<li><a href="/">Index</a></li>
			<li><a href="/page/book">Book</a></li>
			<li><a href="/page/movie">Movie</a></li>
			<li><a href="/page/music">Music</a></li>
			<li><a href="/page/travel">Travel</a></li>
			<li><a href="/page/toolkit">Toolkit</a></li>
			<li><a href="/page/team">Team</a></li>
			<li><a href="/page/about">About</a></li>
		</ul>
eos
)

# Footer HTML
SiteConfig.save_default("footer_html",<<-eos
  <p>Copyright &copy;2007-2012 - Lovingly authored by IceskYsl - All my work is <a href="http://www.opensource.org/licenses/MIT">MIT licensed, Open and Free</a>. </p>
  <p>
    Powered by <a href="http://www.iceskysl.com/" target="_blank" title="Iceylog is a blog  in Ruby">Iceylog</a> - Theme by <a href="http://www.iceskysl.com/" target="_blank" title="iceskysl's blog.">IceskYsl@1.s.t</a> 
    - Build by <a href="http://daringfireball.net/projects/markdown/" target="_blank" title="Markdown is a text-to-HTML conversion tool for web writers">Markdown</a>,
    <a href="https://github.com/" target="_blank" title="GitHub">GitHub</a>,  
    <a href="http://disqus.com/" target="_blank" title="Disqus is a global comment system that improves discussion on websites and connects conversations across the web.">Disqus</a>
  </p>	
eos
)
 

#some default seeds
c = Category.create(:name => "默认分类")

#pages
Page.create(:slug=>"about", :title => "About")
Page.create(:slug=>"book", :title => "Book")
Page.create(:slug=>"movie", :title => "Movie")
Page.create(:slug=>"music", :title => "Music")
Page.create(:slug=>"team", :title => "Team")
Page.create(:slug=>"travel", :title => "travel")
Page.create(:slug=>"toolkit", :title => "Toolkit")

#Post
Post.create(:category_id => c.id, :title => "blog post title", :body => "This is a new post body,support **Markdown** format..",:tag_list => "demo,tag")

#Site
Site.create(:name => "Iceskysl Blog",:url => "http://www.iceskysl.com")
