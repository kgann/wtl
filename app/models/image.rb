class Image < ActiveRecord::Base
  attr_accessible :post_id, :item_id, :filename, :title, :photo_loop, :asset
  belongs_to :post
  belongs_to :item
  belongs_to :artist

  has_attached_file :asset, :styles => { :gallery => "450x450#", :thumb => "75x75#", :photo_loop => "310x240#" }

  # PREFIX = 'wtl'
  # 
  # def self.save_image(attributes)
  #   img = Image.new attributes
  #   img.filename = "#{PREFIX}_#{UUIDTools::UUID.timestamp_create.to_s}.jpg"
  #   img.save
  # end
end