ActiveAdmin.register Link do
  before_filter :only => :index do 
    @per_page = 10 
  end
end
