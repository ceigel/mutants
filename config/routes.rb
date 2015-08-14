Rails.application.routes.draw do
  resources :teams
  resources :mutants
  root to: 'mutants#index'
end
