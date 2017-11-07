Rails.application.routes.draw do
  resources :countries do
    resources :cities, only: [:new, :create]
  end

  resources :cities, except: [:new, :create, :index] do
    resources :planes, only: [:new, :create]
  end

  resources :planes, except: [:new, :create, :index] do
    resources :passengers, only: [:new, :create]
    resources :tickets, only: [:new, :create]
  end

  resources :passengers, except: [:new, :create, :index]
  resources :tickets, except: [:new, :create, :index]

  root 'countries#index'
end
