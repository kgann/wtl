class AlterPostsTable < ActiveRecord::Migration
  def change
    change_column :posts, :body, :text
  end
end
