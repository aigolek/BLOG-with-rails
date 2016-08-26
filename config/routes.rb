Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :posts do 
    resources :comments
  end  
  get 'about', to: 'menu#about' 
  get 'help', to: 'menu#help'
  #post 'comments', to: 'comments#create'
  #resources :comments
  #get 'users/:id', to:'users#show', as: 'user'
  resources :users, only: [:show, :destroy]
  post 'likes', to: 'likes#create'
  post 'unlike', to: 'likes#destroy'
  
  #get 'posts/:post_title/comments', to:'comments#index', as: 'post_comments' 
end
