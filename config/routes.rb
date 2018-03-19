Rails.application.routes.draw do
  root 'application#index'

  devise_for :users

  resources :users, only: [:show, :destroy]

  resources :groups, only: [:new, :create :edit, :update, :destroy] do
    resources :lists, only: [:new, :create, :edit, :update, :show, :destroy]
  end
    resources :tasks, only: [:edit, :update, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
