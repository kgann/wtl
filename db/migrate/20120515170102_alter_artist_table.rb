class AlterArtistTable < ActiveRecord::Migration
  def up
    remove_column :artists, :username
    remove_column :artists, :password
    remove_column :artists, :salt
  end

  def down
  end
end