Bharatresource::Application.routes.draw do
  ### Routes for Admin Controlles
  match 'admin', :to => "admin#index", :as => "admin", via: :get
  namespace :admin do
    resources :states
  end
end