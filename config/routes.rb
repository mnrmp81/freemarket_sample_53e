Rails.application.routes.draw do

  # devise_for :users
  devise_for :users, controllers: {
   registrations: 'users/registrations',
   omniauth_callbacks: 'users/omniauth_callbacks'
 }
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    member do
      get 'transaction'
      post 'buy'
      get 'done'
    end
  end

  resources :mypages do
    member do
      get 'logout'
      get 'identification'
      get 'edit'
      get 'index'
      get 'profile'
      get 'deliver_address'
      get 'verified_card'
      get 'card'
      get 'create_card'
      get 'purchase'
      get 'purchased'
      get 'listing'
      get 'in_transaction'
      get 'completed_transaction'
      get 'telephone_number'
      get 'email_password'
    end
  end

  root 'posts#index'
  
  resources :credit_card, only: [:new, :show] do
    collection do
      get 'registration'
      post 'show', to: 'credit_card#show'
      post 'pay', to: 'credit_card#pay'
      post 'delete', to: 'credit_card#delete'
    end
  end


  resources :address, only: :new do
    member do
      post "create"
      post "update", to: 'address#update', as: 'update'
    end
  end

  resources :profiles, only: :new do
    member do
      get "edit_address_delivery"
      post "update"
    end
  end

  resources :users, only: :index do
    collection do
      get 'sms_confirmation'
      get 'done'
    end
  end

  resources :user_session, only: :create
  resources :address_session, only: :create
end
