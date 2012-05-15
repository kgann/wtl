class Item < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :category
  belongs_to :artist
  has_many :images
end
