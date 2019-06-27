Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts
  resources :mypages, only: :index do
    collection do
      get 'logout'
    end
  end
  root 'posts#index'
end
