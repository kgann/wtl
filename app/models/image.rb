class Image < ActiveRecord::Base
  attr_accessible :filename, :title, :photo_loop, :asset
  has_and_belongs_to_many :posts
  has_and_belongs_to_many :items
  has_and_belongs_to_many :artists

  validates_presence_of :title

  has_attached_file :asset, :styles => { :gallery => "450x450#", :thumb => "75x75#", :photo_loop => "310x240#" }

  default_scope :order => 'updated_at DESC'

end