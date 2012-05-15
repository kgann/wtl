class ShopInfo < ActiveRecord::Base
  attr_accessible :address, :city, :shop_info, :state, :phone_number, :hours, :zip
  self.table_name = :shop_info
end