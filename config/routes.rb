Rails.application.routes.draw do
  devise_for :mutants

  unauthenticated do
    root :to => redirect('/mutants/sign_in')
  end

  authenticated :mutant do
    resources :teams do
      resources :tasks, except: [:index, :show]
      resources :members, only: [:create, :destroy] do
        get 'edit', on: :collection
      end
    end

    resources :mutants, except: [:create, :new]
    root to: 'mutants#home', :as => :user_root
  end
end
