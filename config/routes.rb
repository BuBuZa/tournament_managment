Rails.application.routes.draw do
  get 'teams/create'
    resources :teams, only: [:index, :new, :create]
    get 'tournament/schedule', to: 'tournament#schedule'
    post 'tournament/generate_schedule', to: 'tournament#generate_schedule', as: :generate_schedule_tournament


  get 'tournament/schedule'
  get 'teams/index'
  get 'teams/new'
  get 'teams/create'
  root 'teams#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  # Defines the root path route ("/")
  # root "articles#index"
end
