Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  post '/signup', to: 'users#create'
  post '/login', to: 'authentication#authenticate'

  post 'user/:username/message', to: 'messages#create', as: :create_user_message
  get 'user/:username/messages', to: 'messages#index', as: :user_messages
end
