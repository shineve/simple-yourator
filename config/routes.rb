Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'main#index'

  # jobs
  get '/jobs', to: 'jobs#index'

  resources :companies do
    resources :jobs
  end

  # admin
  get '/admin', to: 'admin#index'
  get '/admin/company', to: 'admin/companies#edit'
  get '/admin/jobs/new', to: 'admin/jobs#new'
  get '/admin/jobs/:id', to: 'admin/jobs#edit'

  namespace :admin do
    resources :companies, except: :destroy do
      resources :jobs, only: %i[index show create update destroy]
    end

    resources :jobs
  end
end
