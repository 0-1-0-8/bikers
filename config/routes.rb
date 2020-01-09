Rails.application.routes.draw do
  devise_for :admins
  resources :users
  resources :bikes
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
