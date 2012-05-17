class Image < ActiveRecord::Base
  attr_accessible :post_id, :item_id, :filename, :title, :photo_loop, :asset
  belongs_to :post
  belongs_to :item
  has_and_belongs_to_many :artist

  validates_presence_of :title

  has_attached_file :asset, :styles => { :gallery => "450x450#", :thumb => "75x75#", :photo_loop => "310x240#" }
end