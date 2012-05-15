class CreateArtistImagesJoinTable < ActiveRecord::Migration
  def up
    create_table :artists_images, :id => false do |t|
      t.integer :artist_id
      t.integer :image_id
    end
  end

  def down
    drop_table :artists_images
  end
end
