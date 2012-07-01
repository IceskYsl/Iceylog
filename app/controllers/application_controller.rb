class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :init_aside
    
  def render_404
    render_optional_error_file(404)
  end
  
  def render_403
    render_optional_error_file(403)
  end
  
  def render_optional_error_file(status_code)
    status = status_code.to_s
    if ["404","403", "422", "500"].include?(status)
      render :template => "/errors/#{status}", :format => [:html], :handler => [:erb], :status => status, :layout => "application"
    else
      render :template => "/errors/unknown", :format => [:html], :handler => [:erb], :status => status, :layout => "application"
    end
  end
  
  def init_aside
    @aside_sites = Site.limit(15)
    @aside_categories = Category.limit(15)
    @aside_posts = Post.last_actived.limit(15)
    init_aside_by_month
  end
  
 
  def init_aside_by_month
    posts = Post.normal.all
    @month = {}
    posts.each do |post|
  	  date = post.created_at.strftime('%Y%m')
  	  if @month[date]
        @month.store("#{date}",@month["#{date}"] + 1)
      else
        @month.store("#{date}",1)
      end   
   end
   @array_mon = @month.sort.reverse! 
  end
  
end
