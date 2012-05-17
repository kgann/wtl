ActiveAdmin.register Item do
  menu :label => "Store Items", :parent => "The Store"

  form :html => { :multipart => true } do |f|
    f.inputs "Item" do
      f.input :category, :include_blank => false, :required => true, :hint => "Add a new category [The Store > Categories] if you need to"
      f.input :artist, :include_blank => false, :required => true, :hint => "The artist you choose determines the pay-pal account used for a purchase"
      f.input :name, :required => true
      f.input :price
      f.input :description, :required => true
      f.input :images, :input_html => { :class => 'img_select' }
    end
    f.buttons
  end

end
