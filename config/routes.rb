Rails.application.routes.draw do
  devise_for :users

  root to: 'site#index'

  get '/profile/:id', to: 'site#show', as: 'profile'

  resources :problems, only: [:index, :show, :new, :create, :destroy] do
  end
  resources :decisions, only: [:index, :show, :new, :create]

end

