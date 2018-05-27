Rails.application.routes.draw do
  root 'schedules#index'
  resources :settings
  resources :services

  resources :schedules
end
