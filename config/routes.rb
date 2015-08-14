Rails.application.routes.draw do
  resources :mutants
  root to: 'mutants#index'
end
