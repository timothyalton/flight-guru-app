Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'welcome#homepage'

  resources :users
  resources :terminals
  resources :restaurants
  resources :flights
  resources :bookings



  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  post 'terminal_selection_id' => 'terminals#terminal_selection_id'
  post 'booking_selection_id' => 'bookings#booking_selection_id'
  
end
