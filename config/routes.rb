Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'items#index'
  get 'items/test' => 'items#test'
  resources :users do
    get 'sign_up_menu', on: :collection
    get 'phone_registration', on: :collection
    get 'complete_registration', on: :collection
    get 'information', on: :collection
    get 'logout', on: :collection
    get 'payment', on: :collection
    put 'information_update', on: :member
    put 'phone_confirmation', on: :member
    put 'phone_authenticated', on: :member
    get 'profile', on: :collection
    resources :addresses
    resources :payments
  end
  resources :items do
    get 'purchase', on: :collection
  end
end
