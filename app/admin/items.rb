ActiveAdmin.register Item do
  menu :label => "Store Items", :parent => "The Store"

  form :html => { :multipart => true } do |f|
    f.inputs "Item" do
      f.input :category, :include_blank => false, :required => true, :hint => "Add a new category [The Store > Categories] if you need to"
      f.input :artist, :include_blank => false, :required => true, :hint => "The artist you choose determines the pay-pal account used for a purchase"
      f.input :name, :required => true
      f.input :price
      f.input :description, :required => true
      f.input :images, :collection => Image.all.map{ |img| [img.title, img.id, {:title => img.asset.url(:thumb)}] }, :input_html => { :class => 'img_select' }, :hint => "Hold ctrl to select multiple images"
    end
    f.buttons
  end

end
