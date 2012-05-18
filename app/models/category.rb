class Category < ActiveRecord::Base
  attr_accessible :name, :category_id, :price, :artist_id, :description
  has_many :items
  has_many :images

  validates_presence_of :name

  def to_param
    name
  end
end
