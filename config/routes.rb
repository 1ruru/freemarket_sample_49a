Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'items#index'
  resources :users do
    get 'sign_up_menu', on: :collection
  end
  resources :items
end
