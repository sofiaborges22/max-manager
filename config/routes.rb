Rails.application.routes.draw do
  devise_for :users

  root to: 'site#index'

  get '/profile/:id', to: 'site#show', as: 'profile'

  resources :problems, only: [:index, :show, :new, :create, :destroy] do
  	resources :decisions, only: [:index, :show, :new, :create, :destroy] do 
  		member do 
        get :result
      end
    end
    resources :break_evens, only: [:index, :new, :show, :create, :destroy]do 
  		member do 
        get :result
      end
    end
    resources :crossover_analysis, only: [:index, :new, :show, :create, :destroy]do 
  		member do 
        get :result
      end
    end
  end


end

