class Artist < ActiveRecord::Base
  attr_accessible :usernme, :email, :first_name, :last_name, :nickname

  def get_name
    [self.first_name, self.nickname, self.last_name].compact.join(" ")
  end
end
