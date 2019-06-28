Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts
  resources :mypages, only: :index
  root 'posts#index'
  resources :profiles do
    collection do
      get 'new_1'
      get 'new_2'
      get 'new_3'
      get 'new_4'
      get 'new_5'
      get 'new_6'
      get 'new_7'
    end
  end
    
end
