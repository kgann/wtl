class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.integer :artist_id
      t.timestamps
    end
  end
end
