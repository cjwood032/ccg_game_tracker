Rails.application.routes.draw do
  root "static_pages#home"
  get "/signin", to: "sessions#new"
  post '/signin' => 'sessions#create'
  post "/sessions/create", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"
  post "/decks/new", to: "decks#new"
  post "/games/save", to: "games#save"
  post "/decks/:id/delete", to: "decks#destroy"
  post"/users/:id/delete", to: "users#destroy"
  resources :decks
  resources :games
  resources :ccgs
  resources :users
end
