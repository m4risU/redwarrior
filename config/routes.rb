Redwarrior::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  # get "posts/index"
  # get "posts/show"
  match "posts" => "posts#index"
  match "posts/:id" => "posts#show", :as => :post

  root :to => "about#index"

  match "locale/change" => "locales#change", :as => :locale

  scope "(:locale)", :locale => /en|pl/ do
    match "services" => 'services#index', :as => :services
    match "contact" => 'contact#index', :as => :contact
    match "portfolio" => 'portfolio#index', :as => :portfolio
    match "about" => 'about#index', :as => :about
  end

  #match "about" => 'about#index'
  #resources :products

end
