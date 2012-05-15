class Artist < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :nickname, :profile_image_id
  has_many :images
  has_many :items
  has_many :posts

  def to_param
    "#{first_name}_#{last_name}"
  end

  def get_name
    display_name = [first_name]
    display_name << "'#{nickname}'" unless nickname.blank?
    display_name << last_name
    display_name.join(" ")
  end
  alias :name :get_name # for active admin

  def profile_image
    Image.find(profile_image_id) if profile_image_id
  end

  def self.find_by_url(url)
    first_name, last_name = url.split("_")
    Artist.where(:first_name => first_name, :last_name => last_name).first
  end

end
