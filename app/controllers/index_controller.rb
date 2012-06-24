class IndexController < ApplicationController
  #index
  def index
    @posts = Post.last_actived.limit(15)
    

  end
end
