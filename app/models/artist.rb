class Artist < ActiveRecord::Base
  attr_accessible :usernme, :email, :first_name, :last_name, :nickname
  has_many :images

  def get_name
    display_name = [self.first_name]
    display_name << "'#{self.nickname}'" if self.nickname
    display_name << self.last_name
    display_name.join(" ")
  end
end
