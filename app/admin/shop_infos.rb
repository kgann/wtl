ActiveAdmin.register ShopInfo do
  menu :label => "Studio Info"
  actions :all, :except => [:new, :destroy]
end
