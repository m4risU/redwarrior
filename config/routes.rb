Redwarrior::Application.routes.draw do
  root :to => "about#index"

  match "locale/change" => "locales#change", :as => :locale

  scope "(:locale)", :locale => /en|pl/ do
    match "services" => 'services#index', :as => :services
    match "contact" => 'contact#index', :as => :contact
    match "portfolio" => 'portfolio#index', :as => :portfolio
    match "about" => 'about#index', :as => :about
  end

  match "/:locale/" => "about#index"

  #match "about" => 'about#index'
  #resources :products

end
