# coding: utf-8
class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::SoftDelete 
  include Mongoid::CounterCache
  include Mongoid::BaseModel
  
  STATE = {
    :draft => 0,
    :normal => 1
  }
  
  field :title  
  field :body
  field :body_html
  field :state, :type => Integer, :default => STATE[:normal]
  field :tags, :type => Array, :default => []
  field :comments_count, :type => Integer, :default => 0
  
  belongs_to :category
  counter_cache :name => :category, :inverse_of => :posts
    
  #index
  index :tags
  index :category_id
  index :state
  
  # counter :hits, :default => 0
  
  attr_accessible :title, :body, :tag_list,:category_id
  attr_accessor :tag_list
  
  validates_presence_of :title, :body, :tag_list,:category_id

  # scopes
  scope :normal, where(:state => STATE[:normal])
  scope :by_tag, Proc.new { |t| where(:tags => t) }
  scope :last_actived, desc("updated_at").desc("created_at")
  scope :fields_for_list, without(:body,:body_html)
  
  before_save :split_tags
  def split_tags
    if !self.tag_list.blank? and self.tags.blank?
      self.tags = self.tag_list.split(/,|，/).collect { |tag| tag.strip }.uniq
    end
  end
  
  before_save :markdown_for_body_html
  def markdown_for_body_html
    return true if not self.body_changed?

    self.body_html = MarkdownConverter.convert(self.body)
  rescue => e
    Rails.logger.error("markdown_for_body_html failed: #{e}")
  end
  
  # 给下拉框用
  def self.state_collection
    STATE.collect { |s| [s[0], s[1]]}
  end
  
end
