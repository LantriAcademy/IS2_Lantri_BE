Rails.application.routes.draw do
  resources :evidences
  resources :supports
  resources :helps
  resources :benefiteds
  resources :foundations
  resources :admins
  resources :events
  resources :contributors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
