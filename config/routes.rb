Rails.application.routes.draw do
  devise_for :users
  get 'tweets/index'
  root "tweets#index"
  resources :tweets
  resources :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
end
