ActiveAdmin.register Category do
  controller do
    defaults :finder => :find_by_name
  end
end
