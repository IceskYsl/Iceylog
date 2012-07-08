# coding: utf-8
class Category
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::BaseModel
  
  #field
  field :name
  field :summary
  field :sort, :type => Integer, :default => 0
  field :posts_count, :type => Integer, :default => 0
  
  has_many :posts
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
  scope :hots, desc(:posts_count)
  scope :sorted, desc(:sort)
  
  #merge
  def self.merge(target_category_id,source_category_id)
    @category = Category.find(source_category_id)
    @posts = @category.posts.each  {|post| post.update_attribute(:category_id,target_category_id) }
    @category.destroy
  end
  
end
