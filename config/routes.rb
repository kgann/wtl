Wtl::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :artists
  resources :items
  resources :categories
  resources :faqs, :only => [:index]
  resources :posts

  match "news/Archive" => "news#archive"
  resources :news, :only => [:show, :index]

  root :to => 'home#index'
end
