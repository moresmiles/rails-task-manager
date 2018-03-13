Rails.application.routes.draw do
  root 'application#index'

  devise_for :users

  resources :groups do
    resources :lists
  end
    resources :tasks

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
