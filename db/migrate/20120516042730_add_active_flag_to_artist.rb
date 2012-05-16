class AddActiveFlagToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :active, :boolean, :default => true
  end
end
