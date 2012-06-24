# coding: utf-8
# 单页的文档页面
# 采用 Markdown 编写
require "redcarpet"
class Page
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::BaseModel
  include Mongoid::SoftDelete
  
  # 页面地址
  field :slug
  field :title
  # 原始 Markdown 内容
  field :body
  # Markdown 格式化后的 html
  field :body_html

  
  attr_accessible :title, :body, :slug
    
  index :slug
  
  #validates
  validates_format_of :slug, :with => /^[a-z0-9\-_]+$/
  validates_uniqueness_of :slug
  
  before_save :markdown_for_body_html
  def markdown_for_body_html
    return true if not self.body_changed?

    self.body_html = MarkdownConverter.convert(self.body)
  rescue => e
    Rails.logger.error("markdown_for_body_html failed: #{e}")
  end
  
  def self.find_by_slug(slug)
    where(:slug => slug).first
  end
  
end
