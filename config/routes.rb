Rails.application.routes.draw do
  resources :wikis

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :users, only: [:update]

  resources :charges, only: [:new, :create]

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
