class AddProfileImageIdToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :profile_image_id, :integer
  end
end
