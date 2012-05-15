class Image < ActiveRecord::Base
  has_and_belongs_to_many :artists

  attr_accessible :photo_loop

  PREFIX = 'wtl'

  def self.save_image(attributes)
    img = Image.new attributes
    img.filename = "#{PREFIX}_#{UUIDTools::UUID.timestamp_create.to_s}.jpg"
    img.save
  end
end