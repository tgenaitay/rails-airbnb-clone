Rails.application.routes.draw do
  get 'orders/index'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :menus do
    resources :orders, only: [:index, :create, :update, :new]
  end
  resources :orders, only: [:destroy]

  get "chef/orders" => "orders#chef_index"

  get "orders" => "orders#index"
  get "chef/" => "pages#chef"
  get "chef/:id" => "pages#landingchef"
  get "orders/:id/approve" => "orders#approve", as: "approve"
  get "orders/:id/reject" => "orders#reject", as: "reject"
  get "mymenus" => "menus#mymenus"


  mount Attachinary::Engine => "/attachinary"



  resources :users, only: [:show]
  root to: 'pages#home'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
