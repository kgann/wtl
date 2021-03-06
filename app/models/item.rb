class Item < ActiveRecord::Base
  attr_accessible :category_id, :artist_id, :price, :description, :name, :asset, :image_ids
  belongs_to :category
  belongs_to :artist
  has_and_belongs_to_many :images

  accepts_nested_attributes_for :images

  validates_presence_of :name, :category_id, :price, :artist_id, :description
end
