Rails.application.routes.draw do
  resources :employees, only: [:edit, :update, :show]
  resources :employees do
    member do
      get 'edit_personal'
      put 'update_personal'
      patch 'update_personal'

      put 'update_parent_type'
      patch 'update_parent_type'

      put 'optin_selection'
      patch 'optin_selection'
    end
  end
  resources :dependents
  get 'getcycles', to: 'dependents#getcyclesbypolicy'
  namespace :admin do
    get 'dashboard', to: 'welcome#index'
    resources :employees do
      collection do
        get 'export_csv'
        get 'import_csv'
        post 'import_csv_create'
      end
    end
    resources :policies
    resources :cycles
    resources :top_ups
  end

  if Current.user
    root 'home#index'
  else
    root 'sessions#new'
  end
  get 'welcome', to: 'welcome#index'
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
