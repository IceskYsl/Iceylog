class Cpanel::HomeController < Cpanel::ApplicationController
  
  def index
    @recent_posts = Post.recent.limit(5)
  end
end
