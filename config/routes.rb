Rails.application.routes.draw do
  #devise_for :contributors
  namespace :contributor do
      resources :events
  end
  resources :sessions, only: [:create, :destroy]
  resources :contributor_events
  resources :interest_foundations
  resources :interest_contributors
  resources :pictures
  resources :status_of_helps
  resources :type_of_helps
  resources :interests
  resources :evidences
  resources :supports
  resources :helps
  resources :benefiteds
  resources :foundations
  resources :directors
  resources :events
  resources :contributors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/foundations/page/:id', to: 'foundations#foundation_page'
  
end
