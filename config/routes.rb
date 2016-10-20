Rails.application.routes.draw do
  get 'orders/index'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :menus do
    resources :orders, only: [:index, :create, :update, :new]
  end

  get "orders" => "orders#index"
  get "chef/:id" => "pages#landingchef", as: "chef"
  get "chef/" => "pages#chef"
  get "chef/orders" => "orders#index"

  mount Attachinary::Engine => "/attachinary"



  resources :users, only: [:show]
  root to: 'pages#home'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
