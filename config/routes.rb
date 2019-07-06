Rails.application.routes.draw do

  # devise_for :users
  devise_for :users, controllers: {
   registrations: 'users/registrations',
   omniauth_callbacks: 'users/omniauth_callbacks'
 }
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    collection do
      get 'buy'
    end
  end

  resources :mypages, only: :index do
    collection do
      get 'logout'
      get 'identification'
    end
  end

  root 'posts#index'
  
  resources :credit_card, only: :new
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
