Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'items#index'

  resources :users do
    get 'sign_up_menu', on: :collection
    get 'phone_registration', on: :collection
    get 'complete_registration', on: :collection
    put 'phone_confirmation', on: :member
    put 'phone_authenticated', on: :member
    resources :addresses
    resources :payments
  end
  resources :items do
    get 'items/exhibit' => 'items#exhibit', on: :collection
    get 'items/purchase' => 'items#purchase', on: :collection
  end
end
