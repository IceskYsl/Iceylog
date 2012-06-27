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
    # @post.hits.incr
  end
  
  def category
    @category = Category.find(params[:id])
    @posts = @category.posts.last_actived.paginate(:page => params[:page],:per_page => 10)
    render :action => "index" #, :stream => true
  end
  
  def tag    
    scoped_posts = Post.by_tag(params[:tag])
    @posts = scoped_posts.recent.paginate :page => params[:page], :per_page => 10
    render :action => "index" #, :stream => true
  end
  
  
  
end
