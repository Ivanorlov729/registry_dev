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


  get 'registry_view' => 'registry#registry_view'
  get 'preview/:id' => 'registry#purchase'
  get 'manage_registry' => 'registry#manage_registry'
  get '/registry_list/:id'  => 'registry#registry_list'
  get 'subscriptions' => 'registry#subscriptions'
 
  match '/account_settings' => 'registry#account_settings'
  match '/new_payment' => 'registry#new_payment'
  match '/add_registry' => 'registry#add_registry'
  match 'update_subscription' => 'registry#update_subscription'
  resources :sessions, only: [:new, :create, :destroy]
  match '/signin', 	to: 'sessions#new', 		via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'


end

