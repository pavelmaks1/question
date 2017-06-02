Rails.application.routes.draw do

  resources :questions do
    resources :answers, only: [:create, :destroy, :update]
  end


  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users, only: [:show]
  root 'static_pages#index'

  get 'about', to: 'static_pages#about'
  get 'profile', to: 'static_pages#profile'
  get 'sign_out', to: 'devise#sign_out'
end
