Rails.application.routes.draw do
  get 'purchase/index'
  get 'purchase/done'
  get 'card/new'
  get 'card/show'
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
    resources :purchases, only: :index do
      post 'pay', on: :collection
      get 'done', on: :collection
    end
  end
  namespace :api do
    resources :items, only: :new, defaults: { format: 'json' }
  end

  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
end
