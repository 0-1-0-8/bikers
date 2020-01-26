Rails.application.routes.draw do
  get 'homes/about'
  get 'homes/top'
  root 'homes#top'
  devise_for :users, :controllers => {
    :sessions => "users/sessions",
    :passwords => "users/passwords",
    :registrations => "users/registrations"
  }
  devise_for :admins, :controllers => {
    :sessions => "admins/sessions"
  }
  resources :users, only: [:create,:show,:edit, :update, :destroy] do
    resources :comments,only: [:create, :destroy]
    resource :favorites,only: [:create, :destroy]
  end

  post 'bikes' => 'bikes#create'
  get 'bikes' => 'bikes#index'
  get 'bikes/:id' => 'bikes#show', as: 'bike'
  get 'bikes/:id/edit' => 'bikes#edit', as: 'edit_bike'
  patch 'bikes/:id' => 'bikes#update', as: 'update_bike'
  delete 'bikes/:id' => 'bikes#destroy', as: 'destroy_bike'

  resources :comments

  post   '/favorite/:bike_id' => 'favorites#favorite',   as: 'favorite'
  delete '/favorite/:bike_id' => 'favorites#unfavorite', as: 'unfavorite'

  resources :follows, only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
