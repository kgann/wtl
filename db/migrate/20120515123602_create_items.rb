class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :category_id
      t.integer :price
      t.integer :artist_id
      t.string :description
      t.timestamps
    end
  end
end
