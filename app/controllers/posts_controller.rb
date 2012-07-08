class PostsController < ApplicationController
  
  
  def index
    scoped_posts = Post.normal
    if !params[:tag].blank?
      scoped_posts = scoped_posts.by_tag(params[:tag])
    end
    @posts = scoped_posts.recent.paginate :page => params[:page], :per_page => 10
  end
  
  def show
    @post = Post.find(params[:id])
    render_404 if @post.nil?
    @post.hits_incr
    # @post.hits.incr
  end
  
  def category
    @category = Category.find(params[:id])
    @posts = @category.posts.last_actived.paginate(:page => params[:page],:per_page => 10)
    render :action => "index" #, :stream => true
  end
  
  def tag    
    scoped_posts = Post.normal.by_tag(params[:tag])
    @posts = scoped_posts.recent.paginate :page => params[:page], :per_page => 10
    render :action => "index" #, :stream => true
  end
  
  def month
    month = params[:month] || Time.now.strftime('%Y%m') 
    start = Date.strptime("#{month}",'%Y%m').beginning_of_month
    finish= Date.strptime("#{month}",'%Y%m').end_of_month
    logger.info"======#{start}====#{finish}"
    @posts = Post.normal.by_month(start,finish).paginate :page => params[:page], :per_page => 10
    render :action => "index"
  end
  
  
end
