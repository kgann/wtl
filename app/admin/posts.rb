ActiveAdmin.register Post do
  index do
    column :id
    column :title
    column :body
    column :artist do |post|
      link_to "#{post.artist.get_name}", admin_artist_path(post.artist)
    end
    default_actions
  end

  form do |f|
    f.inputs "Post" do
      f.input :artist
      f.input :title
      f.input :body
    end
    f.buttons
  end

end
