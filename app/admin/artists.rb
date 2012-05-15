ActiveAdmin.register Artist do
  controller do
    defaults :finder => :find_by_url
  end
end
