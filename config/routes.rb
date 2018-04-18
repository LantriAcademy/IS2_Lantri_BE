Rails.application.routes.draw do
  
  resources :directors
  resources :events
  resources :contributors
  
  devise_for :directors
  devise_for :contributors
  
  resources :foundations do
      resources :benefiteds
  end
  resources :contributors do
      resources :events
  end
  
  resources :signin_contributor, only: [:create, :destroy]
  resources :signin_director, only: [:create, :destroy]

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
  #Foundations routes 
  get '/foundations/page/:page', to: 'foundations#foundation_page'
  get '/foundation/size', to: 'foundations#foundation_size'
  get '/foundation/benefiteds/page/:foundation_id/:page', to: 'benefiteds#benefitedsfoundation_page'
  get '/foundation/benefited/size/:foundation_id', to: 'benefiteds#benefitedsfoundation_size'
  get '/foundation/events/:foundation_id', to: 'events#eventsfoundation'
  #get '/foundations/benefiteds/:id' to: 'foundations#foundation_benefiteds'
  
  
  get '/events_pdf', to: 'events_pdf#show'
  get '/events_pdf/:id', to: 'events_pdf#showById'
  
  post '/contributor_events', to: 'contributor_events#create' 
  
  post '/signin_contributor/google', to: 'signin_contributor#googlesign'
  post '/signin_director/google', to: 'signin_director#googlesign'

  resources :directors
  resources :events
  resources :contributors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 
end
