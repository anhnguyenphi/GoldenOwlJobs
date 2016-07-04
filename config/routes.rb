Rails.application.routes.draw do
  # routing for admin management
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root "jobs#index"

  # Routing for jobs
  get 'load_more_jobs', to: 'jobs#load_more', as: 'load_more_jobs'

  resources :jobs do
    resources :job_applications, only: [:new, :create, :destroy]
  end

  post 'search' => 'jobs#search'

  # Routing for employer
  devise_for :employers,
              controllers: {
                              sessions: 'employers/sessions',
                              registrations: 'employers/registrations',
                              passwords: 'employers/passwords',
                              unlocks: 'employers/unlocks',
                              confirmations: 'employers/confirmations'
                            }

  resources :companies, only: [:show, :index]

  namespace :employers do
    resources :job_applications, only: [:show, :index]
    resources :jobs
  end

  # Routing for employee
  devise_for :employees, controllers: {
    registrations: 'employees/registrations',
    sessions: 'employees/sessions',
    passwords: 'employees/passwords'
  }

  namespace :employees do
    resources :job_applications, only: [:show, :index, :destroy]
  end

  # Routing for the services pages of employer
  get 'services_for_employer' => 'employers#info'

end
