class IndexController < ApplicationController
  #index
  def index
    @posts = Post.normal.recent.paginate :page => params[:page], :per_page => 10
  end
end
