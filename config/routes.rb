Rails.application.routes.draw do

  devise_for :directors
  devise_for :contributors
  
  resources :signin_contributor, only: [:create, :destroy]
  resources :signin_director, only: [:create, :destroy]

  resources :interest_foundations
  resources :interest_contributors
  resources :pictures
  resources :status_of_helps
  resources :type_of_helps
  resources :interests
  resources :evidences
  resources :supports
  resources :helps
  resources :directors
  
  #Foundations routes 
  resources :foundations do
    collection do
      get 'page/:page', to: 'foundations#foundation_page'
      get 'size', to: 'foundations#foundation_size'
      get 'stats/benefiteds', to: 'foundations#foundation_age_stats'
      get 'yearevent', to: 'foundations#years_event' 
      get 'yeareventdata', to: 'foundations#years_event_data' 
      
      resources :benefiteds do
        collection do
          get 'page/:foundation_id/:page', to: 'benefiteds#benefitedsfoundation_page'
          get 'size/:foundation_id', to: 'benefiteds#benefitedsfoundation_size'
        end
      end
      
      resources :events do
        collection do
          get ':foundation_id', to: 'events#eventsfoundation'
        end
      end
    end
  end

  resources :contributors do
    collection do
      get 'yearevent', to: 'contributors#years_event' 
      get 'yeareventdata', to: 'contributors#years_event_data' 
      get 'events/:contributor_id', to: 'events#eventscontributor'
      post 'reset_password', to: 'contributors#reset_password'
      post 'change_password', to: 'contributors#change_password'
      
      resources :events do
        collection do
          post '', to: 'contributor_events#create'
        end
      end
    end
  end

  #Event routes 
  resources :events do
    collection do
      get 'pdf/:id', to: 'events_pdf#show'
    end
  end
 
  resources :benefiteds do
    collection do
      get 'pdf/:id', to: 'events_pdf#show'
      get 'pdf/:id/:userId', to: 'benefiteds_pdf#showById'
    end
  end
  
  #Sing IN routes 
  post '/signin_contributor/google', to: 'signin_contributor#googlesign'
  post '/signin_director/google', to: 'signin_director#googlesign'

  #Charts Routes
  post '/chart_pdf', to: 'chart_pdf#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
end