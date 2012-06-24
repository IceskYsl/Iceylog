 

# coding: utf-8
class Cpanel::ApplicationController < ApplicationController
  layout "cpanel"
  # before_filter :require_admin
  before_filter :require_admin

  protected
  
  def require_admin
     authenticate_or_request_with_http_basic do |username, password|
       logger.info("SiteConfig.site_author_username.to_s:#{username == SiteConfig.site_author_username.to_s}")
       logger.info("SiteConfig.site_author_password.to_s:#{password == SiteConfig.site_author_password.to_s}")
         username == SiteConfig.site_author_username.to_s && password == SiteConfig.site_author_password.to_s
      end
  end
  
 
  
end