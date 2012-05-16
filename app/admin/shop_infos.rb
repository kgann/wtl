ActiveAdmin.register ShopInfo do
  menu :label => "The Studio"
  actions :all, :except => [:new, :destroy]

  form do |f|
    f.inputs "Shop Info" do
      f.input :address, :required => true
      f.input :city, :required => true
      f.input :state, :required => true
      f.input :zip, :required => true
      f.input :phone_number, :required => true
      f.input :hours, :required => true
    end
    f.buttons
  end

end
