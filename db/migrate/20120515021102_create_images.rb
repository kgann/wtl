class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :filename, :unique => true
      t.boolean :photo_loop
      t.timestamps
    end
  end
end
