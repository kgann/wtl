Wtl::Application.routes.draw do
  resources :artists
  resources :items
  resources :categories
  resources :faqs, :only => [:index]
  resources :posts

  match "news/Archive" => "news#archive"
  resources :news, :only => [:show, :index]

  root :to => 'home#index'
end
