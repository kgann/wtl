class CreateImagesPostsJoinTable < ActiveRecord::Migration
  def up
    create_table :images_posts, :id => false do |t|
      t.integer :post_id
      t.integer :image_id
    end
  end

  def down
    drop_table :posts_images
  end
end
