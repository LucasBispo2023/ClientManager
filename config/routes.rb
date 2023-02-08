Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :admin_backoffice do
    resources :admins
  end

  resources :clients


  # Defines the root path route ("/")
  root "welcome#index"
end
