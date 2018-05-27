Rails.application.routes.draw do
  root 'schedules#index'
  resources :settings
  resources :services
  resources :schedules

  delete '/notifications/:id', to: 'notifications#destroy'

  namespace :api do
    post '/bot', to: 'bot#talk'
    get '/bot', to: 'bot#talk'
  end
end
