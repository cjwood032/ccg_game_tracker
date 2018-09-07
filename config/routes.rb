Rails.application.routes.draw do
  root "static_pages#home"
  get "/signin", to: "sessions#new"
  post '/signin' => 'sessions#create'
  post "/sessions/create", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"
  post "/decks/new", to: "decks#new"
  post "/games/save", to: "games#save"
  post "/games/delete", to: "games#delete"
  post "/decks/:id/delete", to: "decks#destroy"
  post"/users/:id/delete", to: "users#destroy"
  get"/users/:id/decks_index", to: "users#decks_index"
  get '/auth/google_oauth2/callback' => 'sessions#gcreate'
  get '/auth/facebook/callback' => 'sessions#gcreate'
  post '/decks/:deck_id/games', to: "games#create_withdeck"
  resources :decks do
    resources :games
  end
  resources :games
  resources :ccgs
  resources :users
end
