Rails.application.routes.draw do

  devise_for :mutants
  resources :teams do
    resources :tasks, except: [:index, :show]
    resources :members, only: [:create, :destroy] do
      get 'edit', on: :collection
    end
  end

  resources :mutants, except: [:create, :new]
  root to: 'mutants#index'
end
