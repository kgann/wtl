class CreateShopInfo < ActiveRecord::Migration
  def change
    create_table :shop_info do |t|
      t.string :address
      t.string :city
      t.string :state
      t.string :phone_number
      t.string :hours
      t.string :zip
      t.timestamps
    end
  end
end
