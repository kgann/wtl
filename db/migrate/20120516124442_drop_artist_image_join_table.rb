class DropArtistImageJoinTable < ActiveRecord::Migration
  def change
    drop_table :artists_images
  end
end
