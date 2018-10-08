Rails.application.routes.draw do
  
  root "users#index"

  # Self-written routes/url
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout/:id', to: 'sessions#destroy', as: 'logout'
  get 'home', to: 'users#home', as: 'home'
  get 'tictactoe', to: 'sessions#tictactoe', as: 'tictactoe'

  
  resources :users
  resources :sessions

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
