Rails.application.routes.draw do
  root to: 'companies#index'

  resources :companies, only: [:index, :show]
  resources :cities, only: [:index, :show]
  resources :starred_companies, only: [:create]

  get '/auth/slack/callback', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

end
