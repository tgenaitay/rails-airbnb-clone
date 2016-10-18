Rails.application.routes.draw do
  get 'menus/index'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :menus do
    resources :orders, only: [:index, :create, :update, :new]
  end

  get "orders" => "orders#index"
  get "chef" => "pages#chef"
  get "chef/orders" => "orders#index"


  resources :users, only: [:show]
  root to: 'pages#home'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
