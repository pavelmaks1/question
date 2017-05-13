Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations' }
  root 'static_pages#index'

  get 'about', to: 'static_pages#about'
  get 'profile', to: 'static_pages#profile'
  get 'sign_out', to: 'devise#sign_out'
end
