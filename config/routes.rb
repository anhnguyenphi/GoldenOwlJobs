Rails.application.routes.draw do

  root "jobs#index"

  resources :jobs
  
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

  devise_for :employees, controllers: {
    registrations: 'employees/registrations',
    sessions: 'employees/sessions',
    passwords: 'employees/passwords'
  }
  get 'services_for_employer' => 'employers#info'
  
end
