Rails.application.routes.draw do
  devise_for :users, :controllers => {
    registrations: 'users/registrations',
    sessions: 'users/sessions'   
  } 
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  
  get 'tweets/index'
  root "tweets#index"
  resources :tweets do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: :create
    collection do
      get 'search'
    end
    collection do
      get 'about'
    end
    collection do
      get 'kiyaku'
    end
    collection do
      get 'privacy'
    end
  end
  resources :users do
    collection do
      get 'search'
    end
    member do
      get :profile
     end
  end
  resources :users do
    member do
     get :following, :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]
end
