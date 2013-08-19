Registry::Application.routes.draw do
  resources :events
  resources :offers

  resources :luxe_registries
  root :to => "home#index"
  resources :luxe_registries

  get 'find_registry' => 'home#find_registry'
  match 'find_registry_results' =>'home#find_registry_results'
  get 'schedule_consultation' => 'home#schedule_consultation'
  get 'categories' => 'home#categories'
  get 'registry_view' => 'home#registry_view'
  get 'preview' => 'home#purchase'

  get 'manage_registry' => 'home#manage_registry'
  get 'subscriptions' => 'home#subscriptions'
  match 'account_settings' => 'home#account_settings'

  match 'new_payment' => 'home#new_payment'
  resources :sessions, only: [:new, :create, :destroy]
  match '/signin', 	to: 'sessions#new', 		via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'


end

