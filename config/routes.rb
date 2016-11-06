Rails.application.routes.draw do
  root to: 'companies#index'

  resources :companies, only: [:index, :show]
  resources :cities,    only: [:index, :show]
end
