Rails.application.routes.draw do

  resources :places
  devise_for :users, controllers: { registrations: 'registrations', passwords: 'passwords' },
                    path: '', path_names: { confirmation: 'verification', unlock: 'unlock', sign_in: 'login', sign_out: 'logout', sign_up: 'sign_up' }

  resources :users
  resources :roles

  root to: 'home#index'
end
