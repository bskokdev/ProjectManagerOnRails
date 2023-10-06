Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users' }

  resources :users

  resources :projects do
    resources :tasks
  end

  root 'home#index'
end
