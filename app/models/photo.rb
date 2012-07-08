# coding: utf-8
class Photo
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::BaseModel

  field :image
  field :filename
  field :content_type

 

  attr_accessible :image

  # 封面图
  mount_uploader :image, PhotoUploader

end