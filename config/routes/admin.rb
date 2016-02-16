Bharatresource::Application.routes.draw do
  ### Routes for Admin Controlles
  match 'admin', :to => "admin#index", :as => "admin", via: :get
  namespace :admin do
    resources :states
    resources :regions
    resources :industries
    resources :sub_industries
    resources :workers
  end
end