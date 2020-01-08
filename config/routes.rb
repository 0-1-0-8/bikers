Rails.application.routes.draw do
  get 'bikes/index'
  get 'bikes/show'
  get 'bikes/edit'
  get 'bikes/update'
  get 'bikes/destroy'
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
