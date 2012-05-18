class CreateImagesItemsJoinTable < ActiveRecord::Migration
  def up
    create_table :images_items, :id => false do |t|
      t.integer :item_id
      t.integer :image_id
    end
  end

  def down
    drop_table :items_images
  end
end
