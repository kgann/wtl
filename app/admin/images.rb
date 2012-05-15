ActiveAdmin.register Image do
  index do
    column :id
    column :title
    column :filename
    column "Photo Loop", :photo_loop
    column "Preview" do |img|
      image_tag("thumbs/#{img.filename}", :class => 'preview')
    end
    default_actions
  end

  show do |img|
    attributes_table do
      row :id
      row :title
      row :filename
      row :photo_loop
      row "Preview" do
        image_tag("thumbs/#{img.filename}")
      end
    end
  end

end
