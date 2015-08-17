Rails.application.routes.draw do
  resources :teams do
    resources :tasks, except: [:index, :show]
  end

  resources :mutants
  root to: 'mutants#index'
end
