class DropZombieImageColumns < ActiveRecord::Migration
  def change
    remove_column :images, :filename
  end
end
