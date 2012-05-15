Wtl::Application.routes.draw do
  resources :artists
  root :to => 'home#index'
end
