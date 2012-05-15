class Post < ActiveRecord::Base
  attr_accessible :title, :body
  has_many :images
  belongs_to :artist
end
