ActiveAdmin.register Artist do
  scope :active, :default => true do |artists|
    artists.where(:active => :true)
  end

   scope :inactive, :default => false do |artists|
     artists.where(:active => :false)
   end

  controller do
    defaults :finder => :find_by_url
  end

  form do |f|
    f.inputs "Artist Details and Portfolio" do
      f.input :first_name
      f.input :last_name
      f.input :nickname, :hint => 'If you wanna be like Radar'
      f.input :active
      f.input :profile_image_id, :label => "Profile Image ID", :hint => "Lookup the ID in the images section"
      f.input :images, :label => "Portfolio", :input_html => { :class => 'img_select' }
      f.buttons
    end
  end
end
