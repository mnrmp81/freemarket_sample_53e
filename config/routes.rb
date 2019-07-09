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

  resources :mypages, only: :index do
    collection do
      get 'logout'
      get 'identification'
      get 'edit'
      get 'purchase'
      get 'purchased'
      get 'listing'
      get 'in_transaction'
      get 'completed_transaction'
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


  resources :address, only: :new
  resources :profiles, only: :new

  resources :users, only: :index do
    collection do
      get 'sms_confirmation'
      get 'done'
    end
  end

  resources :user_session, only: :create
  resources :address_session, only: :create
end
