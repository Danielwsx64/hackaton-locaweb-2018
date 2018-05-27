Rails.application.routes.draw do
  resources :settings
  resources :services

  resources :schedules
end
