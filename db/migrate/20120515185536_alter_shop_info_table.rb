class AlterShopInfoTable < ActiveRecord::Migration
  def change
    change_column :shop_info, :hours, :text
  end
end
