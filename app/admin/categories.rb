ActiveAdmin.register Category do
  menu :parent => "The Store"
  controller do
    defaults :finder => :find_by_name
  end
end
