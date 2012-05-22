ActiveAdmin.register Item do
  before_filter :only => :index do 
    @per_page = 10 
  end

  menu :label => "Store Items", :parent => "The Store"

  form :html => { :multipart => true } do |f|
    f.inputs "Item" do
      f.input :category, :include_blank => false, :required => true, :hint => "Add a new category [The Store > Categories] if you need to"
      f.input :artist, :include_blank => false, :required => true, :hint => "The artist you choose determines the pay-pal account used for a purchase"
      f.input :name, :required => true
      f.input :price
      f.input :description, :required => true,  :hint => "To Create Links, use ths format: (link text)[www.google.com]<br />It will become: #{link_to("link text", "http://www.google.com")}".html_safe
      f.input :images, :collection => Image.all.map{ |img| [img.title, img.id, {:title => img.asset.url(:thumb)}] }, :input_html => { :class => 'img_select' }
    end
    f.buttons
  end

  show do
    attributes_table do
      row :id
      row :category
      row :name
      row :price
      row :description
      row :artist do |post|
        link_to "#{post.artist.get_name}", admin_artist_path(post.artist)
      end
      row :images do |post|
        post.images.map{ |img| image_tag img.asset.url(:thumb), :class => 'preview' }.join.html_safe
      end
    end
  end
end
