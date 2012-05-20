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
      f.input :body, :required => true, :hint => "To Create Links, use ths format: (link text)[www.google.com]<br />It will become: #{link_to("link text", "http://www.google.com")}".html_safe
      f.input :images, :collection => Image.all.map{ |img| [img.title, img.id, {:title => img.asset.url(:thumb)}] }, :input_html => { :class => 'img_select' }
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
