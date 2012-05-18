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
      f.input :bio
      f.input :email
      f.input :active
      f.input :profile_image_id, :label => "Profile Image ID", :hint => "Lookup the ID in the images section. If blank, the photo loop will be displayed"
      f.input :images, :label => "Portfolio", :input_html => { :class => 'img_select' }, :hint => "Hold ctrl to select multiple images"
      f.buttons
    end
  end
end
