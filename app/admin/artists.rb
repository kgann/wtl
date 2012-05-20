ActiveAdmin.register Artist do
  menu :parent => "Users"

  scope :active, :default => true do |artists|
    artists.where(:active => true)
  end

   scope :inactive, :default => false do |artists|
     artists.where(:active => false)
   end

  controller do
    defaults :finder => :find_by_url
  end

  index do
    column :id
    column :first_name
    column :last_name
    column :nickname
    column :email
    column :active
    default_actions
  end

  form do |f|
    f.inputs "Artist Details and Portfolio" do
      f.input :first_name, :required => true
      f.input :last_name, :required => true
      f.input :nickname, :hint => 'If you wanna be like Radar'
      f.input :bio, :hint => "To Create Links, use ths format: (link text)[www.google.com]<br />It will become: #{link_to("link text", "http://www.google.com")}".html_safe
      f.input :email
      f.input :active
      f.input :profile_image_id, :as => :select, :collection => Image.all.map{ |img| [img.title, img.id, {:title => img.asset.url(:thumb)}] }
      f.input :images, :collection => Image.all.map{ |img| [img.title, img.id, {:title => img.asset.url(:thumb)}] }, :label => "Portfolio", :input_html => { :class => 'img_select' }
      f.buttons
    end
  end
end
