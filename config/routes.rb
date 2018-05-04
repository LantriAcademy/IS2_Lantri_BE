Rails.application.routes.draw do
  
  resources :directors
  resources :events
  resources :contributors
  
  devise_for :directors
  devise_for :contributors
  
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
  get '/foundation/stats/benefiteds', to: 'foundations#foundation_age_stats'
  get '/foundation/yearevent', to: 'foundations#years_event' 
  get '/foundation/yeareventdata', to: 'foundations#years_event_data' 
  #get '/foundations/benefiteds/:id' to: 'foundations#foundation_benefiteds'
  
  #Contributors routes 
  get '/contributor/yearevent', to: 'contributors#years_event' 
  get '/contributor/yeareventdata', to: 'contributors#years_event_data' 
  get '/contributor/events/:contributor_id', to: 'events#eventscontributor'
  
  #Event routes 
  get '/events_pdf', to: 'events_pdf#show'
  get '/events_pdf/:id', to: 'events_pdf#showById'
  post '/contributor_events', to: 'contributor_events#create' 
  
  #Sing IN routes 
  post '/signin_contributor/google', to: 'signin_contributor#googlesign'
  post '/signin_director/google', to: 'signin_director#googlesign'


  resources :directors
  resources :events
  resources :contributors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 
end