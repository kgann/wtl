ActiveAdmin.register Image do
  scope :in_photo_loop, :default => false do |images|
    images.where(:photo_loop => :true)
  end

  scope :not_in_photo_loop, :default => false do |images|
    images.where(:photo_loop => :false)
  end

  form do |f|
    f.inputs "Image" do
     f.input :title
     f.input :photo_loop
     f.input :asset, :as => :file
    end
    f.buttons
  end

  index do
    column :id
    column :title
    column "Photo Loop", :photo_loop
    column "Preview" do |img|
      image_tag(img.asset.url(:thumb), :class => 'preview')
    end
    default_actions
  end

  show do |img|
    attributes_table do
      row :id
      row :title
      row :photo_loop
      row "Preview" do
        image_tag(img.asset.url(:thumb))
      end
    end
  end

end
