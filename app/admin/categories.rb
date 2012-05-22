ActiveAdmin.register Category do
  before_filter :only => :index do 
    @per_page = 10 
  end

  menu :parent => "The Store"
  controller do
    defaults :finder => :find_by_name
  end
end
