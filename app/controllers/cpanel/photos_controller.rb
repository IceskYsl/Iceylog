# coding: utf-8
class Cpanel::PhotosController < Cpanel::ApplicationController

  
  def index
     @photos = Photo.unscoped.desc(:_id).paginate :page => params[:page], :per_page => 30
  end
  
  def create
    # 浮动窗口上传
    @photo = Photo.new
    @photo.image = params[:Filedata]
    @photo.filename = params[:Filedata].original_filename
    @photo.content_type = params[:Filedata].content_type
    @photo.save!
    render :text => @photo.image.normal.url
  end

  
  def destroy
    @photo = Photo.unscoped.find(params[:id])
    @photo.destroy

    redirect_to(cpanel_photos_path)
  end
  
  
end
