Rails.application.routes.draw do
  devise_for :users

  root to: 'site#index'

  get '/profile/:id', to: 'site#show', as: 'profile'

  resources :problems, only: [:index, :show, :new, :create, :destroy] do
  	resources :decisions, only: [:index, :show, :new, :create, :destroy] 
    resources :break_evens, only: [:index, :new, :show, :create, :destroy]
    resources :crossovers, only: [:index, :new, :show, :create, :destroy]
  end


end

