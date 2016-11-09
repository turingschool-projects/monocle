Rails.application.routes.draw do
  root                         to: 'sessions#show'
  get  '/auth/slack/callback', to: 'sessions#create'
  post '/logout',              to: 'sessions#destroy'

  resources :companies,         only: [:index, :show]
  resources :cities,            only: [:index, :show]
  resources :starred_companies, only: [:create]
end
