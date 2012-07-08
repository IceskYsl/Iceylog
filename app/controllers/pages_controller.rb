class PagesController < ApplicationController
  
  def show
    @page = Page.find_by_slug(params[:id])
    render_404 if @page.nil?
    @post.hits_incr
  end
  
end
