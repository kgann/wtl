class Link < ActiveRecord::Base
  attr_accessible :url, :text

  validates_presence_of :url, :text
end
