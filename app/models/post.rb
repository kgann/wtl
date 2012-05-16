class Post < ActiveRecord::Base
  attr_accessible :title, :body, :artist_id, :asset, :image_ids
  has_many :images
  belongs_to :artist

  accepts_nested_attributes_for :images
end
