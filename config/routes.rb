Rails.application.routes.draw do

  root "jobs#index"

  # Routing for jobs
  resources :jobs do
    resources :job_applications, only: [:new, :create, :destroy]
  end

  # Routing for employer
  devise_for :employers,
              controllers: {
                              sessions: 'employers/sessions',
                              registrations: 'employers/registrations',
                              passwords: 'employers/passwords',
                              unlocks: 'employers/unlocks',
                              confirmations: 'employers/confirmations'
                            }

  resources :employers, only: [:show, :index] do
    get 'jobmanager' => 'employers#manage'
  end

  post 'search' => 'jobs#search'

  # Routing for employee
  devise_for :employees, controllers: {
    registrations: 'employees/registrations',
    sessions: 'employees/sessions',
    passwords: 'employees/passwords'
  }

  # Routing for the services pages of employer
  get 'services_for_employer' => 'employers#info'

end
