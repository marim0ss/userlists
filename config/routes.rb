Rails.application.routes.draw do
  get '/posts/index', to: 'posts#index'
  get '/posts/new', to: 'posts#new'
  post '/posts/new', to: 'posts#create'

  #bootstrapの導入
  root to: 'users#index'
  resources :users do
    resources :posts
  end

end
