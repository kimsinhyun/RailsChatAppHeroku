Rails.application.routes.draw do
  root 'pages#home'

  resources :rooms do
    resources :messages
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_scope :user do
    get 'users', to: 'users#index'
  end

  get 'user/:id', to: 'users#show', as: 'user'
end
