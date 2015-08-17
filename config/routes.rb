Rails.application.routes.draw do

  resources :teams do
    resources :tasks, except: [:index, :show]
    resources :members, only: [:create, :destroy] do
      get 'edit', on: :collection
    end
  end

  resources :mutants
  root to: 'mutants#index'
end
