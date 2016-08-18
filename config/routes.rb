Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :posts
  get 'about', to: 'menu#about' 
  get 'help', to: 'menu#help'
  post 'comments', to: 'comments#create'
  get 'users/:id', to:'users#show', as: 'user'
  post 'likes', to: 'likes#create'
  post 'unlike', to: 'likes#destroy'
end
