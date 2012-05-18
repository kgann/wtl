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

  form :html => { :multipart => true } do |f|
    f.inputs "Post" do
      f.input :artist, :required => true
      f.input :title, :required => true
      f.input :body, :required => true
      f.input :images, :input_html => { :class => 'img_select' }, :hint => "Hold ctrl to select multiple images"
    end
    f.buttons
  end

  # # cntroller override
  # controller do
  #   def create
  #     raise params[:post].to_s
  #   end
  # end

end
