class UpdateImagesTable < ActiveRecord::Migration
  def up
    add_column :images, :artist_id, :integer
  end

  def down
    remove_column :images, :artist_id
  end
end
