ActiveAdmin.register Item do
  menu :label => "Store Items"

  form :html => { :multipart => true } do |f|
    f.inputs "Item" do
      f.input :category, :hint => "Add a new category, in categories, if you need to"
      f.input :artist, :hint => "The artist you choose determines the pay-pal account used for a purchase"
      f.input :name
      f.input :description
      f.input :images, :input_html => { :class => 'img_select' }
    end
    f.buttons
  end

end
